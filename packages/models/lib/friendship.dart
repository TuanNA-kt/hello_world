import 'package:freezed_annotation/freezed_annotation.dart';

part 'friendship.freezed.dart';
part 'friendship.g.dart';

@freezed
abstract class Friendship with _$Friendship {
  const factory Friendship({
    @JsonKey(name: 'friend_id') required String friendId,
    @JsonKey(name: 'created_at') required int createdAt,
    @JsonKey(name: 'chat_room_id') String? chatRoomId,
  }) = _Friendship;

  factory Friendship.fromJson(Map<String, dynamic> json) =>
      _$FriendshipFromJson(json);
}
