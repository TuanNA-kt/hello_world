import 'package:freezed_annotation/freezed_annotation.dart';

import 'message_type.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
abstract class Message with _$Message {
  factory Message({
    required String id,
    required String chatRoomId,
    required String senderId,
    required String content,
    @MessageTypeConverter() required MessageType type,
    String? mediaUrl,
    required DateTime timestamp,
    @Default([])
    List<String> readBy
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}
