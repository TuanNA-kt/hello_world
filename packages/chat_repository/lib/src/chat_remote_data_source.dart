import 'package:firebase_database/firebase_database.dart';
import 'package:models/chat_room.dart';
import 'package:models/chat_room_display.dart';
import 'package:models/message.dart';
import 'package:models/message_type.dart';
import 'package:models/user.dart';

class ChatRemoteDataSource {
  final FirebaseDatabase _firebaseDatabase;

  ChatRemoteDataSource({FirebaseDatabase? firebaseDatabase})
      : _firebaseDatabase = firebaseDatabase ?? FirebaseDatabase.instance;

  // ============================================================================
  // ĐỊNH NGHĨA TẤT CẢ DATABASE REFERENCES
  // ============================================================================
  DatabaseReference get _chatRoomsRef => _firebaseDatabase.ref('chat_rooms');
  DatabaseReference get _usersRef => _firebaseDatabase.ref('users');
  DatabaseReference get _messagesRef => _firebaseDatabase.ref('messages');
  DatabaseReference get _userChatRoomsRef => _firebaseDatabase.ref('user_chat_rooms');
  DatabaseReference get _userReadStatusRef => _firebaseDatabase.ref('user_read_status');

  // ============================================================================
  // STREAM: DANH SÁCH PHÒNG CHAT CỦA USER
  // ============================================================================
  Stream<List<ChatRoomDisplay>> getChatRoomsDisplayStream(String userId) {
    return _userChatRoomsRef
        .child(userId)
        .orderByChild('updated_at')
        .onValue
        .map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data == null) return <ChatRoomDisplay>[];

      final rooms = data.entries.map((entry) {
        final json = Map<String, dynamic>.from(entry.value);
        final chatRoomId = entry.key.toString();
        return ChatRoomDisplay.fromIndexedJson(chatRoomId, json);
      }).toList();

      // RTDB orderBy trả về ASC (cũ -> mới), đảo ngược để mới nhất lên đầu
      return rooms.reversed.toList();
    });
  }

  // ============================================================================
  // STREAM: TIN NHẮN TRONG PHÒNG CHAT
  // ============================================================================
  Stream<List<Message>> getMessagesStream(String chatRoomId, {int limit = 50}) {
    return _messagesRef
        .child(chatRoomId)
        .orderByChild('timestamp')
        .limitToLast(limit)
        .onValue
        .map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data == null) return <Message>[];

      return data.entries.map((entry) {
        final json = Map<String, dynamic>.from(entry.value);
        json['id'] = entry.key;
        return Message.fromJson(json);
      }).toList();
    });
  }

  // ============================================================================
  // ĐỌC TIMESTAMP LẦN CUỐI USER ĐỌC TIN NHẮN
  // ============================================================================
  Future<int> getLastReadTimestamp(String chatRoomId, String userId) async {
    final snapshot = await _userReadStatusRef
        .child(chatRoomId)
        .child(userId)
        .child('last_read_timestamp')
        .get();

    return snapshot.value as int? ?? 0;
  }

  /// Lấy chi tiết một ChatRoom cụ thể (Model Entity đầy đủ)
  Future<ChatRoom?> getChatRoom(String chatRoomId) async {
    final snapshot = await _chatRoomsRef.child(chatRoomId).get();
    if (!snapshot.exists || snapshot.value == null) return null;
    final data = Map<String, dynamic>.from(snapshot.value as Map);
    data['id'] = chatRoomId;
    return ChatRoom.fromJson(data);
  }

  Future<String> createChatRoom({required List<String> participantIds, required String createdRoomUserId}) async {
    final newChatRoomRef = _chatRoomsRef.push();
    final chatRoomId = newChatRoomRef.key!;

    final newChatRoom = ChatRoom(id: chatRoomId, participantIds: participantIds, createdBy: createdRoomUserId);
    final updates = <String, dynamic>{};

    updates['${_chatRoomsRef.path}/$chatRoomId'] = newChatRoom.toJson();
    updates['${_chatRoomsRef.path}/$chatRoomId/createdAt'] = ServerValue.timestamp;
    updates['${_chatRoomsRef.path}/$chatRoomId/updatedAt'] = ServerValue.timestamp;

    for (final userId in participantIds) {
      final path = '${_userChatRoomsRef.path}/$userId/$chatRoomId';
      updates[path] = {
        'updated_at': ServerValue.timestamp,
        'last_message_text': '',
        'sender_id': createdRoomUserId,
      };
    }

    await _firebaseDatabase.ref().update(updates);

    return chatRoomId;
  }

  Future<void> createUser(User user) async {
    final newUserRef = _usersRef.push();
    final updates = <String, dynamic>{};

    updates['$newUserRef/${user.id}'] = user.toJson();
    await _firebaseDatabase.ref().update(updates);
  }

  // ============================================================================
  // GỬI TIN NHẮN - ATOMIC MULTI-PATH UPDATE
  // ============================================================================
  Future<void> sendMessage(
      Message message, {
        required List<String> participantIds,
      }) async {
    // 1. Tạo message ID mới
    final messageRef = _messagesRef.child(message.chatRoomId).push();
    final messageId = messageRef.key!;
    final now = ServerValue.timestamp;

    // 2. Tạo preview text cho index
    final lastMessageText = _buildMessagePreview(message);

    // 3. Tạo message object
    final updatedMessage = message.copyWith(
      id: messageId,
    );

    // 4. Chuẩn bị ATOMIC UPDATE cho tất cả nodes
    final updates = <String, dynamic>{};

    // Node 1: Lưu tin nhắn vào /messages/{chatRoomId}/{messageId}
    _addMessageUpdate(updates, message.chatRoomId, messageId, updatedMessage, now);

    // Node 2: Cập nhật /chat_rooms/{chatRoomId}
    _addChatRoomUpdate(updates, message.chatRoomId, updatedMessage, now);

    // Node 3: Cập nhật index cho TẤT CẢ participants
    _addParticipantIndexUpdates(
      updates,
      participantIds,
      message.chatRoomId,
      lastMessageText,
      message.senderId,
      now,
    );

    // Node 4: Đánh dấu người gửi đã đọc tin nhắn của chính họ
    _addSenderReadStatusUpdate(updates, message.chatRoomId, message.senderId, now);

    // 5. Thực hiện ATOMIC TRANSACTION
    await _firebaseDatabase.ref().update(updates);
  }

  /// Get a specific user by ID (Used to get name/avatar for Chat List)
  Future<User?> getUser(String userId) async {
    final snapshot = await _usersRef.child(userId).get();
    if (!snapshot.exists || snapshot.value == null) return null;

    final json = Map<String, dynamic>.from(snapshot.value as Map);
    json['id'] = userId; // Ensure ID is passed if not in body
    return User.fromJson(json);
  }

  /// Get all users stream (For your "List Friend" / "New Chat" screen)
  Stream<List<User>> getAllUsersStream() {
    return _usersRef.onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data == null) return <User>[];

      return data.entries.map((entry) {
        final json = Map<String, dynamic>.from(entry.value);
        json['id'] = entry.key;
        return User.fromJson(json);
      }).toList();
    });
  }

  Future<List<User>> getAllUsers() async {
    final snapshot = await _usersRef.get();
    final data = snapshot.value as Map<dynamic, dynamic>?;
    print("DataFriendList: $data");
    if (data == null) return <User>[];
    return data.entries.map((entry) {
      final json = Map<String, dynamic>.from(entry.value);
      json['id'] = entry.key;
      return User.fromJson(json);
    }).toList();
  }


  // ============================================================================
  // CẬP NHẬT TRẠNG THÁI ĐỌC KHI USER MỞ PHÒNG CHAT
  // ============================================================================
  Future<void> updateLastReadTimestamp(String chatRoomId, String userId) async {
    final now = DateTime.now().millisecondsSinceEpoch;

    await _userReadStatusRef
        .child(chatRoomId)
        .child(userId)
        .update({'last_read_timestamp': now});
  }

  // ============================================================================
  // PRIVATE HELPER METHODS - XÂY DỰNG ATOMIC UPDATES
  // ============================================================================

  /// Tạo text preview cho tin nhắn (hiển thị trong danh sách chat)
  String _buildMessagePreview(Message message) {
    if (message.type == MessageType.text) {
      return message.content.length > 50
          ? '${message.content.substring(0, 50)}...'
          : message.content;
    }
    return '[${message.type.name}]';
  }

  /// Thêm update cho node /messages/{chatRoomId}/{messageId}
  void _addMessageUpdate(
      Map<String, dynamic> updates,
      String chatRoomId,
      String messageId,
      Message updatedMessage,
      Map<String, String> now
      ) {
    final messagePath = '/messages/$chatRoomId/$messageId';
    updates[messagePath] = updatedMessage.toJson();
    updates['$messagePath/timestamp'] = now;
  }

  /// Thêm update cho node /chat_rooms/{chatRoomId}
  void _addChatRoomUpdate(
      Map<String, dynamic> updates,
      String chatRoomId,
      Message lastMessage,
      Map<String, String> now,
      ) {
    final chatRoomPath = '${_chatRoomsRef.path}/$chatRoomId';
    updates['$chatRoomPath/last_message'] = lastMessage.toJson();
    updates['$chatRoomPath/updated_at'] = now;
  }

  /// Thêm updates cho index của TẤT CẢ participants
  void _addParticipantIndexUpdates(
      Map<String, dynamic> updates,
      List<String> participantIds,
      String chatRoomId,
      String lastMessageText,
      String senderId,
      Map<String, String> now,
      ) {
    for (final userId in participantIds) {
      final indexPath = '${_userChatRoomsRef.path}/$userId/$chatRoomId';
      updates[indexPath] = {
        'last_message_text': lastMessageText,
        'updated_at': now,
        'sender_id': senderId,
      };
    }
  }

  /// Thêm update cho read status của người gửi
  void _addSenderReadStatusUpdate(
      Map<String, dynamic> updates,
      String chatRoomId,
      String senderId,
      Map<String, String> now,
      ) {
    final readStatusPath = '${_userReadStatusRef.path}/$chatRoomId/$senderId';
    updates['$readStatusPath/last_read_timestamp'] = now;
  }
}
