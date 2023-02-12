import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:szufladka_reader/application/auth/form_inputs/sign_up_password_input.dart';
import 'package:szufladka_reader/application/auth/sign_up/sign_up_cubit.dart';

class SignUpPasswordInput extends StatelessWidget {
  const SignUpPasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, current) =>
        previous.password != current.password ||
            previous.submissionStatus != current.submissionStatus,
        builder: (context, state) {
          return TextField(
            onChanged: (newValue) =>
                context.read<SignUpCubit>().onPasswordChanged(newValue),
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter your password...",
              errorText: _getInputErrorMessageIfAny(state),
            ),
          );
        });
  }

  String? _getInputErrorMessageIfAny(SignUpState state) {
    if (state.password.valid || state.submissionStatus != FormzStatus.invalid) {
      return null;
    }
    return signUpPasswordInputErrorMessages[state.password.error];
  }
}
