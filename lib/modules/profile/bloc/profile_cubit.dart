import 'package:authentication_repository/authentication_repository.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:hello_world/common/models/avatar_path.dart';
import 'package:hello_world/common/models/models.dart';
import 'package:hello_world/modules/profile/bloc/profile_state.dart';
import 'package:hello_world/modules/register/model/fullname.dart';
import 'package:media_repository/media_repository.dart';
import 'package:models/user.dart';
import 'package:user_repository/user_repository.dart' hide User;

class ProfileCubit extends Cubit<ProfileState> {
  final UserRepository _userRepository;
  final AuthenticationRepository _authenticationRepository;
  final MediaRepository _mediaRepository;

  ProfileCubit({
    required UserRepository userRepository,
    required AuthenticationRepository authenticationRepository,
    required MediaRepository mediaRepository,
  }) : _userRepository = userRepository,
       _authenticationRepository = authenticationRepository,
       _mediaRepository = mediaRepository,
       super(ProfileState());

  User get _currentUser => _userRepository.currentUser;

  void updateUserProfile() {
    emit(
      state.copyWith(
        user: _currentUser,
        fullNameForm: Fullname.pure(_currentUser.name),
        phoneNumberForm: PhoneNumber.pure(_currentUser.phoneNumber ?? ''),
        birthDayForm: Birthday.pure(_currentUser.birthday),
        temporaryAvatarUrl: AvatarPath.pure(_currentUser.avatarUrl)
      ),
    );
    print("Hello im current user: $_currentUser");
  }

  Future<void> saveNewUserProfile() async {
    emit(state.copyWith(isLoading: true));
    User newUser = state.user.copyWith(
      name: state.fullNameForm.value,
      phoneNumber: state.phoneNumberForm.value,
      birthday: state.birthDayForm?.value,
    );
    if (state.temporaryAvatarUrl?.value != null) {
      final avatarUrl = await _mediaRepository.uploadImageToCloud(state.temporaryAvatarUrl!.value!);
      newUser = state.user.copyWith(avatarUrl: avatarUrl);
    }
    await _userRepository.updateUserToRTDB(newUser);
    emit(state.copyWith(user: _currentUser, isLoading: false));
  }

  Future<void> onAvatarPicked() async {
    final String? imagePath = await _mediaRepository.pickImageFromGallery();
    final avatarPath = AvatarPath.dirty(imagePath);
    if (imagePath != null) {
      emit(
        state.copyWith(
          temporaryAvatarUrl: avatarPath,
          isValid: Formz.validate([
            state.fullNameForm,
            state.phoneNumberForm,
            avatarPath,
            ?state.birthDayForm,
          ]),
        ),
      );
    }
  }

  void onFullNameChanged(String inputFullname) {
    final fullname = Fullname.dirty(inputFullname);
    emit(
      state.copyWith(
        fullNameForm: fullname,
        isValid:
            Formz.validate([
              fullname,
              state.phoneNumberForm,
              ?state.temporaryAvatarUrl,
              ?state.birthDayForm,
            ]) &&
            (state.user.name != inputFullname),
      ),
    );
    print("Hello form profile cubit: $state.isValid.toString()");
  }

  void onPhoneNumberChanged(String inputPhoneNumber) {
    final phoneNumber = PhoneNumber.dirty(inputPhoneNumber);
    emit(
      state.copyWith(
        phoneNumberForm: phoneNumber,
        isValid:
            Formz.validate([
              state.fullNameForm,
              phoneNumber,
              ?state.temporaryAvatarUrl,
              ?state.birthDayForm,
            ]) &&
            (state.user.phoneNumber != inputPhoneNumber),
      ),
    );
  }

  void onBirthdayChanged(DateTime date) {
    final birthday = Birthday.dirty(date.millisecondsSinceEpoch);
    emit(
      state.copyWith(
        birthDayForm: birthday,
        isValid:
            Formz.validate([
              state.fullNameForm,
              state.phoneNumberForm,
              ?state.temporaryAvatarUrl,
              birthday,
            ]) &&
            (state.user.birthday != date.millisecondsSinceEpoch),
      ),
    );
  }

  void resetValidationAndRemoveTempedState() {
    emit(
      state.copyWith(
        temporaryAvatarUrl: null,
        isValid: false,
        isLoading: false,
        isSaving: false,
        isSuccess: false,
      ),
    );
  }
}
