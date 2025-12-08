import 'package:chat_repository/src/chat_remote_data_source.dart';
import 'package:api_client/src/api_service.dart';
import 'package:models/chat_room_display.dart';
import 'package:models/user.dart';
import 'package:rxdart/rxdart.dart';

class ChatRepository {
  final ChatRemoteDataSource _remoteDataSource;
  final ApiService _apiService;

  ChatRepository({required ChatRemoteDataSource remoteDataSource, required ApiService apiService}) :
        _remoteDataSource = remoteDataSource, _apiService = apiService;

  Stream<List<ChatRoomDisplay>> getChatRooms(String userId) {
    // B1: Get base list from Index (Fast)
    final displayStream = _remoteDataSource.getChatRoomsDisplayStream(userId);

    // B2: Enhance with User Details and Unread Counts
    return displayStream.switchMap((displayList) {
      if (displayList.isEmpty) return Stream.value([]);

      final combinedStreams = displayList.map((model) {
        // 1. Calculate Unread Count
        final unreadCountStream = _calculateUnreadCount(model.id, userId);

        // 2. Fetch Name/Avatar (The missing piece you asked for)
        final chatRoomInfoStream = _getChatRoomInfo(model.id, userId);

        // 3. Combine everything
        return Rx.combineLatest2(
          unreadCountStream,
          chatRoomInfoStream,
              (count, info) {
            return model.copyWith(
              name: info.name,
              avatarUrl: info.avatarUrl,
              unreadCount: count,
            );
          },
        );
      });

      return Rx.combineLatestList(combinedStreams);
    });
  }

  Stream<int> _calculateUnreadCount(String chatRoomId, String userId) {
    final lastReadFuture = _remoteDataSource.getLastReadTimestamp(chatRoomId, userId);

    return Stream.fromFuture(lastReadFuture).switchMap((lastReadTimestamp) {
      return _remoteDataSource.getMessagesStream(chatRoomId).map((messages) {
        final unreadMessages = messages.where((msg) =>
        msg.timestamp.millisecondsSinceEpoch > lastReadTimestamp &&
            msg.senderId != userId
        ).toList();
        return unreadMessages.length;
      });
    });
  }

  /// Logic to determine the display Name and Avatar
  Stream<({String name, String avatarUrl})> _getChatRoomInfo(String chatRoomId, String currentUserId) {
    // Fetch the full ChatRoom entity to check participants
    return Stream.fromFuture(_remoteDataSource.getChatRoom(chatRoomId)).asyncMap((chatRoom) async {
      // Fallback for deleted rooms
      if (chatRoom == null) {
        return (name: 'Unknown Chat', avatarUrl: '');
      }

      // 1. Group Chat Logic
      if (chatRoom.isGroup) {
        return (
        name: chatRoom.name ?? 'Group Chat',
        avatarUrl: chatRoom.avatarUrl ?? ''
        );
      }

      // 2. 1-on-1 Chat Logic
      else {
        // Find the "other" person's ID
        final otherUserId = chatRoom.participantIds.firstWhere(
              (id) => id != currentUserId,
          orElse: () => '',
        );

        if (otherUserId.isEmpty) return (name: 'Unknown User', avatarUrl: '');

        // Fetch User Profile from RTDB
        final user = await _remoteDataSource.getUser(otherUserId);

        return (
        name: user?.name ?? 'Unknown User',
        avatarUrl: user?.avatarUrl ?? ''
        );
      }
    });
  }

  Future<void> markChatAsRead(String chatRoomId, String userId) async {
    await _remoteDataSource.updateLastReadTimestamp(chatRoomId, userId);
  }

  // Helper method to get all users for your "List Friend" screen
  Stream<List<User>> getAllUsers() {
    return _remoteDataSource.getAllUsersStream();
  }
}