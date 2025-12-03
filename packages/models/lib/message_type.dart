import 'package:freezed_annotation/freezed_annotation.dart';

enum MessageType { text, image, video, audio, sticker }

class MessageTypeConverter implements JsonConverter<MessageType, String> {
  const MessageTypeConverter();

  @override
  MessageType fromJson(String json) => MessageType.values
      .firstWhere((e) => e.name == json, orElse: () => MessageType.text);

  @override
  String toJson(MessageType type) => type.name;
}
