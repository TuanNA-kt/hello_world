part of 'login_bloc.dart';

final class LoginState extends Equatable {
  final FormzSubmissionStatus status;
  final Username username;
  final Password password;
  final bool isValid;

  LoginState({
    // Bỏ giá trị mặc định của username và password khỏi đây:
    this.status = FormzSubmissionStatus.initial,
    Username? username, // Giờ là nullable
    Password? password,
    bool? isValid,
  }) :
        username = username ?? Username.pure(), // <-- KHÔNG CONST
        password = password ?? Password.pure(), // <-- KHÔNG CONST
        isValid = isValid ?? false;

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