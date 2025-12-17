// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_display.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatRoomDisplay _$ChatRoomDisplayFromJson(Map<String, dynamic> json) =>
    _ChatRoomDisplay(
      id: json['id'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatar_url'] as String,
      updatedAt: (json['updated_at'] as num?)?.toInt(),
      lastMessage: json['last_message'] as String,
      senderId: json['sender_id'] as String,
      unreadCount: (json['unread_count'] as num?)?.toInt() ?? 0,
      isTyping: json['is_typing'] as bool? ?? false,
    );

Map<String, dynamic> _$ChatRoomDisplayToJson(_ChatRoomDisplay instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar_url': instance.avatarUrl,
      'updated_at': instance.updatedAt,
      'last_message': instance.lastMessage,
      'sender_id': instance.senderId,
      'unread_count': instance.unreadCount,
      'is_typing': instance.isTyping,
    };
