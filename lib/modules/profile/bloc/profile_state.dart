import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hello_world/modules/profile/profile_edit/view/birthday_input_field.dart';
import 'package:models/user.dart';

import '../../../common/models/models.dart';
import '../../register/model/fullname.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default('') String language,
    @Default('1.0.0') String appVersion,
    @Default(User.empty) User user,
    @Default(Fullname.pure()) Fullname fullNameForm,
    @Default(PhoneNumber.pure()) PhoneNumber phoneNumberForm,
    DateTime? birthDayForm,
    @Default(false) bool isValid,
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default(false) bool isSuccess,
  }) = _ProfileState;
}