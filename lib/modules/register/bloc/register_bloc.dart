import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:hello_world/common/models/models.dart';
import 'package:hello_world/modules/register/model/fullname.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState>{
  final AuthenticationRepository _authenticationRepository;
  RegisterBloc({required AuthenticationRepository authenticationRepository}) : _authenticationRepository = authenticationRepository,
  super(RegisterState()) {
    on<RegisterFullnameChanged>(_onFullnameChanged);
    on<RegisterUsernameChanged>(_onUsernameChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterAgreementChanged>(_onAgreementChanged);
    on<RegisterSubmitted>(_onSubmitted);
  }

  void _onFullnameChanged(RegisterFullnameChanged event, Emitter<RegisterState> emit) {
    final fullname = Fullname.dirty(event.fullname);
    emit(state.copyWith(fullname: fullname, isValid: Formz.validate([fullname, state.username, state.password])));
  }

  void _onUsernameChanged(RegisterUsernameChanged event, Emitter<RegisterState> emit) {
    final username = Username.dirty(event.username);
    emit(state.copyWith(username: username, isValid: Formz.validate([state.fullname, username, state.password])));
  }

  void _onPasswordChanged(RegisterPasswordChanged event, Emitter<RegisterState> emit) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(password: password, isValid: Formz.validate([state.fullname, password, state.username])));
  }

  void _onAgreementChanged(RegisterAgreementChanged event, Emitter<RegisterState> emit) {
    final isAgreed = event.isAgreed;
    emit(state.copyWith(isAgreed: isAgreed));
  }

  Future<void> _onSubmitted(RegisterSubmitted event, Emitter<RegisterState> emit) async {
    if(state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        await _authenticationRepository.register(fullname: state.fullname.value, username: state.username.value, password: state.password.value);
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch(_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }

}
