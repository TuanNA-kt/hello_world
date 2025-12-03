import 'package:freezed_annotation/freezed_annotation.dart';
import 'message.dart';

part 'chat_room.freezed.dart';
part 'chat_room.g.dart';

@freezed
abstract class ChatRoom with _$ChatRoom {
  factory ChatRoom({
    required String id,
    required List<String> participantIds,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String createdBy,
    String? name,
    String? avatarUrl,
    @Default(false) bool isGroup,
    Message? lastMessage,
    @Default(1) int unreadCount,
  }) = _ChatRoom;

  factory ChatRoom.fromJson(Map<String, dynamic> json) => _$ChatRoomFromJson(json);
}