part of 'sign_in_cubit.dart';

@freezed
class SignInState with _$SignInState {
  factory SignInState({
    required EmailInput email,
    required SignInPasswordInput password,
    required Option<String> errorMessage,
    required FormzStatus submissionStatus,
  }) = _SignInState;

  factory SignInState.initial() => SignInState(
        email: const EmailInput.pure(),
        password: const SignInPasswordInput.pure(),
        errorMessage: none(),
        submissionStatus: FormzStatus.pure,
      );
}
