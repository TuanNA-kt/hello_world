import 'package:formz/formz.dart';

enum PhoneNumberValidationError {
  empty,
  invalidLength,
  containsNonNumeric
}

class PhoneNumber extends FormzInput<String, PhoneNumberValidationError> {
  const PhoneNumber.pure([super.initialPhoneNumber = ""]) : super.pure();
  const PhoneNumber.dirty([super.newPhoneNumber = '']) : super.dirty();

  // Regex để check CHỈ chứa số (và có thể có dấu + ở đầu)
  static final RegExp _phoneRegExp = RegExp(r'^\+?\d+$');

  @override
  PhoneNumberValidationError? validator(String value) {
    final trimmedValue = value.trim();

    if(isPure || value.isEmpty) {
      return null;
    }

    // Check empty. But for now, i let it can be null which means user delete this info
    //if (trimmedValue.isEmpty) return PhoneNumberValidationError.empty;

    // Check chỉ chứa số (và có thể có + ở đầu)
    if (!_phoneRegExp.hasMatch(trimmedValue)) {
      return PhoneNumberValidationError.containsNonNumeric;
    }

    // Check length (loại bỏ dấu + khi đếm)
    final digitsOnly = trimmedValue.replaceAll('+', '');
    if (digitsOnly.length < 9 || digitsOnly.length > 15) {
      return PhoneNumberValidationError.invalidLength;
    }

    return null;
  }
}