// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friendship.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Friendship _$FriendshipFromJson(Map<String, dynamic> json) => _Friendship(
  friendId: json['friend_id'] as String,
  createdAt: (json['created_at'] as num).toInt(),
  chatRoomId: json['chat_room_id'] as String?,
);

Map<String, dynamic> _$FriendshipToJson(_Friendship instance) =>
    <String, dynamic>{
      'friend_id': instance.friendId,
      'created_at': instance.createdAt,
      'chat_room_id': instance.chatRoomId,
    };
