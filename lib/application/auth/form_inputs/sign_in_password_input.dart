import 'package:formz/formz.dart';

enum SignInPasswordValidationError { empty }

final singInPasswordInputErrorMessages = {
  SignInPasswordValidationError.empty: "Password cannot be empty",
};

class SignInPasswordInput
    extends FormzInput<String, SignInPasswordValidationError> {
  const SignInPasswordInput.pure() : super.pure('');

  const SignInPasswordInput.dirty({String value = ''}) : super.dirty(value);

  @override
  SignInPasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return SignInPasswordValidationError.empty;
    }
    return null;
  }
}
