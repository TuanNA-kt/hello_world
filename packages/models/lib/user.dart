
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/user.dart' as prefix0;

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({required String id,
    required String name,
    String? email,
    String? avatarUrl,
    @Default("") String phoneNumber,
    int? birthday,
    int? lastSeen,
    String? fcmToken,
    int? createdAt}) = _User;

  static const empty = User(id: '', name: '', phoneNumber: '');

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

}