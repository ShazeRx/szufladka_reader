import 'package:szufladka_reader/domain/auth/auth_failure.dart';

const authFailureMessages = {
  "weak-password": AuthFailure.weakPassword(),
  "email-already-in-use": AuthFailure.emailInUse(),
  "wrong-password": AuthFailure.invalidPassword(),
  "user-not-found": AuthFailure.userNotFound(),
};
