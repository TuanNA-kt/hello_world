// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Message _$MessageFromJson(Map<String, dynamic> json) => _Message(
  id: json['id'] as String,
  chatRoomId: json['chatRoomId'] as String,
  senderId: json['senderId'] as String,
  content: json['content'] as String,
  type: const MessageTypeConverter().fromJson(json['type'] as String),
  mediaUrl: json['mediaUrl'] as String?,
  timestamp: (json['timestamp'] as num?)?.toInt(),
  readBy:
      (json['readBy'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
  'id': instance.id,
  'chatRoomId': instance.chatRoomId,
  'senderId': instance.senderId,
  'content': instance.content,
  'type': const MessageTypeConverter().toJson(instance.type),
  'mediaUrl': instance.mediaUrl,
  'timestamp': instance.timestamp,
  'readBy': instance.readBy,
};
