import 'package:formz/formz.dart';

enum PhoneNumberValidationError {
  empty,
  invalidLength,
  containsNonNumeric
}

class PhoneNumber extends FormzInput<String, PhoneNumberValidationError> {
  const PhoneNumber.pure([super.initialPhoneNumber =""]) : super.pure();
  const PhoneNumber.dirty([super.newPhoneNumber = '']) : super.dirty();

  static final RegExp _phoneRegExp = RegExp(r'[^\d]');

  @override
  PhoneNumberValidationError? validator(String value) {
    final trimmedValue = value.trim();
    if(trimmedValue.isEmpty) return PhoneNumberValidationError.empty;
    if(!_phoneRegExp.hasMatch(trimmedValue)) {
      return PhoneNumberValidationError.containsNonNumeric;
    }
    if (trimmedValue.length < 9 || trimmedValue.length > 15) {
      return PhoneNumberValidationError.invalidLength;
    }
    return null;

  }

}