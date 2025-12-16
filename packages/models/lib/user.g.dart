// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  phoneNumber: json['phone_number'] as String? ?? "",
  birthday: (json['birthday'] as num?)?.toInt(),
  lastSeen: (json['last_seen'] as num?)?.toInt(),
  fcmToken: json['fcm_token'] as String?,
  createdAt: (json['createdAt'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'avatar_url': instance.avatarUrl,
  'phone_number': instance.phoneNumber,
  'birthday': instance.birthday,
  'last_seen': instance.lastSeen,
  'fcm_token': instance.fcmToken,
  'createdAt': instance.createdAt,
};
