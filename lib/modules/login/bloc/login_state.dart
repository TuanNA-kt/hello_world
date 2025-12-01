part of 'login_bloc.dart';

final class LoginState extends Equatable {
  final FormzSubmissionStatus status;
  final Username username;
  final Password password;
  final bool isValid;

  LoginState({
    this.status = FormzSubmissionStatus.initial,
    Username? username,
    Password? password,
    this.isValid = false,
  }) :
        username = username ?? Username.pure(),
        password = password ?? Password.pure();

  LoginState copyWith({
    FormzSubmissionStatus? status,
    Username? username,
    Password? password,
    bool? isValid,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, username, password];
}