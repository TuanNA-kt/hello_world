import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_request.freezed.dart';
part 'friend_request.g.dart';

enum FriendRequestStatus { pending, accepted, rejected, canceled }

class FriendRequestStatusConverter
    implements JsonConverter<FriendRequestStatus, String> {
  const FriendRequestStatusConverter();

  @override
  FriendRequestStatus fromJson(String json) {
    return FriendRequestStatus.values.firstWhere(
            (e) => e.name == json,
        orElse: () => FriendRequestStatus.pending
    );
  }

  @override
  String toJson(FriendRequestStatus object) => object.name;
}

@freezed
abstract class FriendRequest with _$FriendRequest {
  const factory FriendRequest(
      {required String id, @JsonKey(name: 'created_at') required int createdAt, @JsonKey(name: 'updated_at') int? updatedAt,
      @JsonKey(name: 'from_user_id') required String fromUserId,
      @JsonKey(name: 'to_user_id') required String toUserId,
      @FriendRequestStatusConverter()
      @Default(FriendRequestStatus.pending) FriendRequestStatus? status}) = _FriendRequest;

  factory FriendRequest.fromJson(Map<String, dynamic> json) => _$FriendRequestFromJson(json);
}