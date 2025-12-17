import 'package:freezed_annotation/freezed_annotation.dart';

import 'chat_room.dart';

part 'chat_room_display.freezed.dart';
part 'chat_room_display.g.dart';

@freezed
abstract class ChatRoomDisplay with _$ChatRoomDisplay {
  factory ChatRoomDisplay({
    required String id,
    required String name,
    @JsonKey(name: 'avatar_url')
    required String avatarUrl,
    @JsonKey(name: 'updated_at')
    int? updatedAt,
    @JsonKey(name: 'last_message')
    required String lastMessage,
    @JsonKey(name: 'sender_id')
    required String senderId,
    @JsonKey(name: 'unread_count')
    @Default(0) int unreadCount,
    @JsonKey(name: 'is_typing')
    @Default(false) bool isTyping,
  }) = _ChatRoomDisplay;

  factory ChatRoomDisplay.fromIndexedJson(String id, Map<String, dynamic> json) {
    final updatedTimestamp = json['updated_at'] as int? ?? 0;

    return ChatRoomDisplay(
      id: id,
      name: '',
      avatarUrl: '',
      updatedAt: updatedTimestamp,
      lastMessage: json['last_message'] as String? ?? '',
      senderId: json['sender_id'] as String? ?? '',
      unreadCount: 0,
    );
  }

  factory ChatRoomDisplay.fromJson(Map<String, dynamic> json) => _$ChatRoomDisplayFromJson(json);
}