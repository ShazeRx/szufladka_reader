import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.unexpected() = _Unexpected;

  const factory AuthFailure.invalidPassword() = _InvalidPassword;

  const factory AuthFailure.userNotFound() = _UserNotFound;

  const factory AuthFailure.emailInUse() = _EmailInUse;

  const factory AuthFailure.weakPassword() = _WeakPassword;
}
