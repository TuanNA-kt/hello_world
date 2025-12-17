
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/user.dart' as prefix0;

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({required String id,
    required String name,
    String? email,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'phone_number') @Default("") String phoneNumber,
    int? birthday,
    @JsonKey(name: 'last_seen') int? lastSeen,
    @JsonKey(name: 'fcm_token') String? fcmToken,
    @JsonKey(name: 'created_at') int? createdAt}) = _User;

  static const empty = User(id: '', name: '', phoneNumber: '');

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

}