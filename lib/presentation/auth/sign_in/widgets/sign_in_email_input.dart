import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:szufladka_reader/application/auth/form_inputs/email_input.dart';
import 'package:szufladka_reader/application/auth/sign_in/sign_in_cubit.dart';

class SignInEmailInput extends StatelessWidget {
  const SignInEmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
        buildWhen: (previous, current) =>
            previous.email != current.email ||
            previous.submissionStatus != current.submissionStatus,
        builder: (context, state) {
          return TextField(
            onChanged: (newValue) =>
                context.read<SignInCubit>().onEmailChanged(newValue),
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email...",
              errorText: _getInputErrorMessageIfAny(state),
            ),
          );
        });
  }

  String? _getInputErrorMessageIfAny(SignInState state) {
    if (state.email.valid || state.submissionStatus != FormzStatus.invalid) {
      return null;
    }
    return emailInputErrorMessages[state.email.error];
  }
}
