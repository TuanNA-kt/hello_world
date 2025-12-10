import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/user.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default('') String language,
    @Default('1.0.0') String appVersion,
    @Default(User.empty) User user,
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default(false) bool isSuccess,
  }) = _ProfileState;
}