
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/chat_room_display.dart';

part 'chats_state.freezed.dart';

enum ChatsStatus { initial, loading, success, failure }

@freezed
abstract class ChatsState with _$ChatsState {
  const factory ChatsState({
    @Default(ChatsStatus.initial) ChatsStatus status,
    @Default([]) List<ChatRoomDisplay> chatRooms,
    @Default([]) List<ChatRoomDisplay> filteredChatRooms,
    @Default('') String searchQuery,
    @Default(false) bool isSearching,
    @Default(0) int totalUnreadCount,
    @Default('') String errorMessage
}) = _ChatsState;
}