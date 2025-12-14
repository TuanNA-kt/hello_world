import 'package:authentication_repository/authentication_repository.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:hello_world/common/models/models.dart';
import 'package:hello_world/modules/profile/bloc/profile_state.dart';
import 'package:hello_world/modules/register/model/fullname.dart';
import 'package:models/user.dart';
import 'package:user_repository/user_repository.dart' hide User;

class ProfileCubit extends Cubit<ProfileState> {
  final UserRepository _userRepository;
  final AuthenticationRepository _authenticationRepository;

  ProfileCubit(
      {required UserRepository userRepository, required AuthenticationRepository authenticationRepository})
      : _userRepository = userRepository,
        _authenticationRepository = authenticationRepository,
        super(ProfileState());

  User get _currentUser => _userRepository.currentUser;

  void updateUserProfile() {
    emit(state.copyWith(user: _currentUser));
    print(_currentUser);
  }

  Future<void> saveNewUserProfile() async {
    final newUser = state.user.copyWith(
      name: state.fullNameForm.value,
      phoneNumber: state.phoneNumberForm.value,
      birthday: state.birthDayForm?.millisecondsSinceEpoch
    );
    await _userRepository.updateUserToRTDB(newUser);
    emit(state.copyWith(user: _currentUser));
  }

  Future<void> logOut() async {
    emit(state.copyWith(isLoading: true));
    await _authenticationRepository.logOut();
  }

  void onFullNameChanged(String inputFullname) {
    final fullname = Fullname.dirty(inputFullname);
    emit(state.copyWith(
      fullNameForm: fullname,
      isValid: Formz.validate([state.phoneNumberForm, fullname])
    ));
  }

  void onPhoneNumberChanged(String inputPhoneNumber) {
    final phoneNumber = PhoneNumber.dirty(inputPhoneNumber);
    emit(state.copyWith(
        phoneNumberForm: phoneNumber,
        isValid: Formz.validate([state.fullNameForm, phoneNumber])
    ));
  }

  void onBirthdayChanged(DateTime date) {
    emit(state.copyWith(birthDayForm: date));
  }
}