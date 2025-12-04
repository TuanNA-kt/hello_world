// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_display.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatRoomDisplay _$ChatRoomDisplayFromJson(Map<String, dynamic> json) =>
    _ChatRoomDisplay(
      id: json['id'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      lastMessageText: json['lastMessageText'] as String,
      senderId: json['senderId'] as String,
      unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
      isTyping: json['isTyping'] as bool? ?? false,
    );

Map<String, dynamic> _$ChatRoomDisplayToJson(_ChatRoomDisplay instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'lastMessageText': instance.lastMessageText,
      'senderId': instance.senderId,
      'unreadCount': instance.unreadCount,
      'isTyping': instance.isTyping,
    };
