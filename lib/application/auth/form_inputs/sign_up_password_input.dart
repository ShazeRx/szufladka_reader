import 'package:formz/formz.dart';

enum SignUpPasswordValidationError { empty, tooFewChars, tooWeak }

//TODO: Add the rest of errors
final signUpPasswordInputErrorMessages = {
  SignUpPasswordValidationError.empty: "Password cannot be empty",
  SignUpPasswordValidationError.tooFewChars:
      "Password must contain at least 8 characters.",
  SignUpPasswordValidationError.tooWeak:
      "Password must contain at least one special character, one number, and one upper case letter",
};

class SignUpPasswordInput
    extends FormzInput<String, SignUpPasswordValidationError> {
  const SignUpPasswordInput.pure() : super.pure('');

  const SignUpPasswordInput.dirty({String value = ''}) : super.dirty(value);

  static final RegExp _passwordExp =
      RegExp(r'^(?=.*[A-Z])(?=.*[!@#\$&*~])(?=.*[0-9])(?=.*[a-z]).*$');

  @override
  SignUpPasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return SignUpPasswordValidationError.empty;
    }
    if (value.length < 8) {
      return SignUpPasswordValidationError.tooFewChars;
    }
    if (!_passwordExp.hasMatch(value)) {
      return SignUpPasswordValidationError.tooWeak;
    }
    return null;
  }
}
