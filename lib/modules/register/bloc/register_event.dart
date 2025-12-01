part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

final class RegisterFullnameChanged extends RegisterEvent {
  const RegisterFullnameChanged(this.fullname);

  final String fullname;

  @override
  List<Object> get props => [fullname];
}

final class RegisterUsernameChanged extends RegisterEvent {
  const RegisterUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

final class RegisterPasswordChanged extends RegisterEvent {
  const RegisterPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

final class RegisterAgreementChanged extends RegisterEvent {
  const RegisterAgreementChanged(this.isAgreed);

  final bool isAgreed;

  @override
  List<Object> get props => [isAgreed];
}

final class RegisterSubmitted extends RegisterEvent {
  const RegisterSubmitted();
}
