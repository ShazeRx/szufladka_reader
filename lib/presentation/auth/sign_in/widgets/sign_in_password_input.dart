import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:szufladka_reader/application/auth/form_inputs/sign_in_password_input.dart';
import 'package:szufladka_reader/application/auth/sign_in/sign_in_cubit.dart';

class SignInPasswordInput extends StatelessWidget {
  const SignInPasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
        buildWhen: (previous, current) =>
            previous.password != current.password ||
            previous.submissionStatus != current.submissionStatus,
        builder: (context, state) {
          return TextField(
            onChanged: (newValue) =>
                context.read<SignInCubit>().onPasswordChanged(newValue),
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter your password...",
              errorText: _getInputErrorMessageIfAny(state),
            ),
          );
        });
  }

  String? _getInputErrorMessageIfAny(SignInState state) {
    if (state.password.valid || state.submissionStatus != FormzStatus.invalid) {
      return null;
    }
    return singInPasswordInputErrorMessages[state.password.error];
  }
}
