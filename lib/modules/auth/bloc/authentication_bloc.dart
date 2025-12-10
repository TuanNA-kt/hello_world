import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:models/user.dart';
import 'package:user_repository/user_repository.dart' hide User;

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  final logger = Logger();
  AuthenticationBloc({required AuthenticationRepository authenticationRepository, required UserRepository userRepository}) :
      _authenticationRepository = authenticationRepository,
      _userRepository = userRepository, super(const AuthenticationState.unknown()) {
        on<AuthenticationSubscriptionRequested>(_onSubscriptionRequested);
        on<AuthenticationLogoutPressed>(_onLogoutPressed);
  }

  Future<void> _onSubscriptionRequested(AuthenticationSubscriptionRequested event, Emitter<AuthenticationState> emit) {
    return emit.onEach(_authenticationRepository.status,
    onData: (status) async {
      switch (status) {
        case AuthenticationStatus.unknown:
          return emit(const AuthenticationState.unknown());
        case AuthenticationStatus.unauthenticated:
          return emit(const AuthenticationState.unauthenticated());
        case AuthenticationStatus.authenticated:
          final user = _tryGetUser();
          return emit(user != null ? AuthenticationState.authenticated(user) : const AuthenticationState.unauthenticated());
      }
    },
    onError: addError);
  }

  void _onLogoutPressed(AuthenticationLogoutPressed event, Emitter<AuthenticationState> emit) {
    _authenticationRepository.logOut();
  }

  User? _tryGetUser()  {
    try {
      final user = _userRepository.currentUser;
      logger.i("Try get user: $user");
      return user;
    } catch(_) {
      return null;
    }
  }
}