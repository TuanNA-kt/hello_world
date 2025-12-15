import 'package:formz/formz.dart';

enum BirthdayValidationError { beyondPresent }

class Birthday extends FormzInput<int?, BirthdayValidationError> {
  const Birthday.pure(super.value) : super.pure();

  const Birthday.dirty(super.value) : super.dirty();

  @override
  BirthdayValidationError? validator(int? value) {
    return null;
  }
}