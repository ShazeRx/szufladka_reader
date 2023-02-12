part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  factory SignUpState({
    required EmailInput email,
    required SignUpPasswordInput password,
    required Option<String> errorMessage,
    required FormzStatus submissionStatus,
  }) = _SignUpState;

  factory SignUpState.initial() => SignUpState(
        email: const EmailInput.pure(),
        password: const SignUpPasswordInput.pure(),
        errorMessage: none(),
        submissionStatus: FormzStatus.pure,
      );
}
