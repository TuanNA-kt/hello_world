import 'package:formz/formz.dart';

enum AvatarPathValidationError { tooBig }

class AvatarPath extends FormzInput<String?, AvatarPathValidationError> {
  const AvatarPath.pure(super.value) : super.pure();

  const AvatarPath.dirty(super.value) : super.dirty();

  @override
  AvatarPathValidationError? validator(String? value) {
    return null;
  }
}