import 'package:formz/formz.dart';

enum EmailValidationError { empty, invalidRegex }

final emailInputErrorMessages = {
  EmailValidationError.empty: "Email cannot be empty",
  EmailValidationError.invalidRegex: "Wrong email format"
};

class EmailInput extends FormzInput<String, EmailValidationError> {
  const EmailInput.pure() : super.pure('');

  const EmailInput.dirty({String value = ''}) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
  );

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidationError.empty;
    }
    if (!_emailRegExp.hasMatch(value)) {
      return EmailValidationError.invalidRegex;
    }
    return null;
  }
}
