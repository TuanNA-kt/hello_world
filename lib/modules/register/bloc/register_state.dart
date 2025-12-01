part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final FormzSubmissionStatus status;
  final Fullname fullname;
  final Username username;
  final Password password;
  final bool isAgreed;
  final bool isValid;

  RegisterState({
    this.fullname = const Fullname.pure(),
    Username? username,
    Password? password,
    this.isAgreed = false,
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
  }) : username = username ?? Username.pure(),
       password = password ?? Password.pure();

  RegisterState copyWith({
    FormzSubmissionStatus? status,
    Fullname? fullname,
    Username? username,
    Password? password,
    bool? isAgreed,
    bool? isValid,
  }) {
    return RegisterState(
      status: status ?? this.status,
      fullname: fullname ?? this.fullname,
      username: username ?? this.username,
      password: password ?? this.password,
      isAgreed: isAgreed ?? this.isAgreed,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
    status,
    fullname,
    username,
    password,
    isAgreed,
    isValid,
  ];
}
