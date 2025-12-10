import 'package:authentication_repository/authentication_repository.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/modules/profile/bloc/profile_state.dart';
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

  User get currentUser => _userRepository.currentUser;

  Future<void> logOut() async {
    emit(state.copyWith(isLoading: true));
    await _authenticationRepository.logOut();
  }
}