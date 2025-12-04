import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_display.freezed.dart';
part 'chat_room_display.g.dart';

@freezed
abstract class ChatRoomDisplay with _$ChatRoomDisplay {
  factory ChatRoomDisplay({
    required String id,
    required String name,
    required String avatarUrl,
    required DateTime updatedAt,
    required String lastMessageText,
    required String senderId,
    @Default(0) int unreadCount,
    @Default(false) bool isTyping,
  }) = _ChatRoomDisplay;

  factory ChatRoomDisplay.fromIndexedJson(String id, Map<String, dynamic> json) {
    final updatedTimestamp = json['updated_at'] as int? ?? 0;

    return ChatRoomDisplay(
      id: id,
      name: '',
      avatarUrl: '',
      updatedAt: DateTime.fromMillisecondsSinceEpoch(updatedTimestamp),
      lastMessageText: json['last_message_text'] as String? ?? '...',
      senderId: json['sender_id'] as String? ?? '',
      unreadCount: 0,
    );
  }

  factory ChatRoomDisplay.fromJson(Map<String, dynamic> json) => _$ChatRoomDisplayFromJson(json);
}