import 'package:formz/formz.dart';

enum FullNameValidationError { empty }

class Fullname extends FormzInput<String, FullNameValidationError> {
  const Fullname.pure([super.initialFullName = ""]) : super.pure();
  const Fullname.dirty([super.value = ''])  : super.dirty();

  @override
  FullNameValidationError? validator(String value) {
   if(value.isEmpty) return FullNameValidationError.empty;
   return null;
  }
}