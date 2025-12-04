// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
  isOnline: json['isOnline'] as bool,
  lastSeen: DateTime.parse(json['lastSeen'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'avatarUrl': instance.avatarUrl,
  'isOnline': instance.isOnline,
  'lastSeen': instance.lastSeen.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
};
