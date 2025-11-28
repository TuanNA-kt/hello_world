import 'package:formz/formz.dart';

enum PasswordValidationError {
  empty,
  tooShort,
  missingLowercase,
  missingUppercase,
  missingDigit,
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  // Regex patterns
  static final _lowercaseRegex = RegExp(r'[a-z]');
  static final _uppercaseRegex = RegExp(r'[A-Z]');
  static final _digitRegex = RegExp(r'[0-9]');

  @override
  PasswordValidationError? validator(String value) {
    // Check empty
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }

    // Check độ dài tối thiểu 8 ký tự
    if (value.length < 8) {
      return PasswordValidationError.tooShort;
    }

    // Check có chữ thường (a-z)
    if (!_lowercaseRegex.hasMatch(value)) {
      return PasswordValidationError.missingLowercase;
    }

    // Check có chữ hoa (A-Z)
    if (!_uppercaseRegex.hasMatch(value)) {
      return PasswordValidationError.missingUppercase;
    }

    // Check có số (0-9)
    if (!_digitRegex.hasMatch(value)) {
      return PasswordValidationError.missingDigit;
    }

    // Tất cả đều OK
    return null;
  }
}