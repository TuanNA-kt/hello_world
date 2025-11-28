import 'package:formz/formz.dart';

enum EmailValidationError { invalid }

class Username extends FormzInput<String, EmailValidationError>
    with FormzInputErrorCacheMixin {
  Username.pure([super.value = '']) : super.pure();

  Username.dirty([super.value = '']) : super.dirty();

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    return _emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}