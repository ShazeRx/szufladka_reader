import 'package:szufladka_reader/application/auth/form_inputs/email_input.dart';
import 'package:szufladka_reader/domain/auth/auth_failure.dart';

String getErrorMessage(AuthFailure authFailure) {
  return authFailure.map(
    unexpected: (_) => "Unexpected",
    invalidPassword: (_) => "Invalid password",
    userNotFound: (_) => "User not found",
    emailInUse: (_) => "Email already in use",
    weakPassword: (_) => "Weak password",
  );
}
