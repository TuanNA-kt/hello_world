import 'package:freezed_annotation/freezed_annotation.dart';

import 'message_type.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
abstract class Message with _$Message {
  factory Message({
    required String id,
    @JsonKey(name: 'chat_room_id')
    required String chatRoomId,
    @JsonKey(name: 'sender_id')
    required String senderId,
    required String content,
    @JsonKey(name: 'message_type')
    @MessageTypeConverter() required MessageType type,
    @JsonKey(name: 'media_url')
    String? mediaUrl,
    int? timestamp,
    @JsonKey(name: 'read_by')
    @Default([])
    List<String> readBy
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}
