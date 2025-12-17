// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatRoom _$ChatRoomFromJson(Map<String, dynamic> json) => _ChatRoom(
  id: json['id'] as String?,
  participantIds: (json['participant_ids'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  createdAt: (json['created_at'] as num?)?.toInt(),
  updatedAt: (json['updated_at'] as num?)?.toInt(),
  createdBy: json['created_by'] as String,
  name: json['name'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  isGroup: json['is_group'] as bool? ?? false,
  lastMessage: json['last_message'] == null
      ? null
      : Message.fromJson(json['last_message'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ChatRoomToJson(_ChatRoom instance) => <String, dynamic>{
  'id': instance.id,
  'participant_ids': instance.participantIds,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'created_by': instance.createdBy,
  'name': instance.name,
  'avatar_url': instance.avatarUrl,
  'is_group': instance.isGroup,
  'last_message': instance.lastMessage,
};
