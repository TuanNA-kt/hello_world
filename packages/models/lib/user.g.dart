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
  lastSeen: (json['lastSeen'] as num?)?.toInt(),
  fcmToken: json['fcmToken'] as String?,
  createdAt: (json['createdAt'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'avatarUrl': instance.avatarUrl,
  'lastSeen': instance.lastSeen,
  'fcmToken': instance.fcmToken,
  'createdAt': instance.createdAt,
};
