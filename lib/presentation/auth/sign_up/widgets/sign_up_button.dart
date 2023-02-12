import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:szufladka_reader/application/auth/sign_up/sign_up_cubit.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
      previous.submissionStatus != current.submissionStatus,
      builder: (context, state) {
        final isFormSubmissionInProgress =
            state.submissionStatus == FormzStatus.submissionInProgress;
        return ElevatedButton(
          onPressed: () => context.read<SignUpCubit>().onSubmit(),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: isFormSubmissionInProgress
                ? const SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(),
            )
                : const Text("Sign Up"),
          ),
        );
      },
    );
  }
}