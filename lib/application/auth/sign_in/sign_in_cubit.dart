import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:szufladka_reader/application/auth/auth_error_messages.dart';
import 'package:szufladka_reader/application/auth/form_inputs/email_input.dart';
import 'package:szufladka_reader/application/auth/form_inputs/sign_in_password_input.dart';
import 'package:szufladka_reader/domain/auth/firebase_auth_facade.dart';

part 'sign_in_state.dart';

part 'sign_in_cubit.freezed.dart';

@lazySingleton
class SignInCubit extends Cubit<SignInState> {
  final FirebaseAuthFacade _authFacade;

  SignInCubit({required FirebaseAuthFacade authFacade})
      : _authFacade = authFacade,
        super(SignInState.initial());

  Future<void> onSubmit() async {
    if (!_validateForm()) return;

    emit(state.copyWith(submissionStatus: FormzStatus.submissionInProgress));

    final emailValue = state.email.value;
    final passwordValue = state.password.value;

    final failureOrSuccess = await _authFacade.signInWithEmailAndPassword(
        email: emailValue, password: passwordValue);

    failureOrSuccess.fold(
      (failure) => emit(
        state.copyWith(
          submissionStatus: FormzStatus.submissionFailure,
          errorMessage: some(
            getErrorMessage(failure),
          ),
        ),
      ),
      (success) =>
          emit(state.copyWith(submissionStatus: FormzStatus.submissionSuccess)),
    );

    emit(state.copyWith(errorMessage: none()));
  }

  void onEmailChanged(String newValue) {
    final email = EmailInput.dirty(value: newValue);

    emit(state.copyWith(email: email));
  }

  void onPasswordChanged(String newValue) {
    final password = SignInPasswordInput.dirty(value: newValue);

    emit(state.copyWith(password: password));
  }

  bool _validateForm() {
    final email = state.email;
    final password = state.password;

    final status = Formz.validate([
      email,
      password,
    ]);

    emit(state.copyWith(submissionStatus: status));

    return status.isValidated;
  }
}
