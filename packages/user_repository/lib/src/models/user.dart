import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class User extends Equatable {
  /// {@macro user}
  const User({
    required this.id,
    this.email,
    this.name,
    this.photo,
  });

  /// The current user's email address.
  final String? email;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String? name;

  /// Url for the current user's photo.
  final String? photo;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: '');

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'name': name,
    'photo': photo,
  };

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as String,
    email: json['email'] as String?,
    name: json['name'] as String?,
    photo: json['photo'] as String?,
  );

  @override
  List<Object?> get props => [email, id, name, photo];
}