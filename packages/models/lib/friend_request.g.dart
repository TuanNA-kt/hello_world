// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FriendRequest _$FriendRequestFromJson(Map<String, dynamic> json) =>
    _FriendRequest(
      id: json['id'] as String,
      createdAt: (json['created_at'] as num).toInt(),
      updatedAt: (json['updated_at'] as num?)?.toInt(),
      fromUserId: json['from_user_id'] as String,
      toUserId: json['to_user_id'] as String,
      status:
          _$JsonConverterFromJson<String, FriendRequestStatus>(
            json['status'],
            const FriendRequestStatusConverter().fromJson,
          ) ??
          FriendRequestStatus.pending,
    );

Map<String, dynamic> _$FriendRequestToJson(_FriendRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'from_user_id': instance.fromUserId,
      'to_user_id': instance.toUserId,
      'status': _$JsonConverterToJson<String, FriendRequestStatus>(
        instance.status,
        const FriendRequestStatusConverter().toJson,
      ),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
