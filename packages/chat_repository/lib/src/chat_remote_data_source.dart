import 'package:firebase_database/firebase_database.dart';
import 'package:models/chat_room_display.dart';

class ChatRemoteDataSource {
  final FirebaseDatabase _firebaseDatabase;

  ChatRemoteDataSource({FirebaseDatabase? firebaseDatabase}) : _firebaseDatabase = firebaseDatabase ?? FirebaseDatabase.instance;

  DatabaseReference get _chatRoomsRef => _firebaseDatabase.ref('chat_rooms');
  DatabaseReference get _usersRef => _firebaseDatabase.ref('users');
  DatabaseReference get _messagesRef => _firebaseDatabase.ref('messages');
  DatabaseReference get _userChatRoomsRef => _firebaseDatabase.ref('user_chat_rooms');

  Stream<List<ChatRoomDisplay>> getChatRoomsDisplayStream(String userId) {
    return _userChatRoomsRef.child(userId)
    // Tận dụng RTDB để sắp xếp theo thời gian cập nhật
        .orderByChild('updated_at')
        .onValue
        .map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data == null) return <ChatRoomDisplay>[];

      final rooms = data.entries.map((entry) {
        final json = Map<String, dynamic>.from(entry.value);
        final chatRoomId = entry.key.toString();

        // Ánh xạ dữ liệu index vào Display Model
        final displayModel = ChatRoomDisplay.fromIndexedJson(chatRoomId, json);
        return displayModel;
      }).toList();

      // RTDB trả về từ nhỏ nhất đến lớn nhất, ta đảo ngược lại (mới nhất lên đầu)
      return rooms.reversed.toList();
    });
  }
}