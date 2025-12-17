// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Message _$MessageFromJson(Map<String, dynamic> json) => _Message(
  id: json['id'] as String,
  chatRoomId: json['chat_room_id'] as String,
  senderId: json['sender_id'] as String,
  content: json['content'] as String,
  type: const MessageTypeConverter().fromJson(json['message_type'] as String),
  mediaUrl: json['media_url'] as String?,
  timestamp: (json['timestamp'] as num?)?.toInt(),
  readBy:
      (json['read_by'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
  'id': instance.id,
  'chat_room_id': instance.chatRoomId,
  'sender_id': instance.senderId,
  'content': instance.content,
  'message_type': const MessageTypeConverter().toJson(instance.type),
  'media_url': instance.mediaUrl,
  'timestamp': instance.timestamp,
  'read_by': instance.readBy,
};
