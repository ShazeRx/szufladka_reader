import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:szufladka_reader/application/auth/sign_in/sign_in_cubit.dart';
import 'package:szufladka_reader/injection.dart';
import 'package:szufladka_reader/presentation/auth/sign_in/widgets/sign_in_button.dart';
import 'package:szufladka_reader/presentation/auth/sign_in/widgets/sign_in_email_input.dart';
import 'package:szufladka_reader/presentation/auth/sign_in/widgets/sign_in_password_input.dart';
import 'package:szufladka_reader/presentation/routes/app_router.gr.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignInCubit>(),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {
            state.errorMessage.fold(
                () {},
                (error) => {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(error)))
                    });
            if(state.submissionStatus == FormzStatus.submissionSuccess){
              AutoRouter.of(context).popAndPush(const HomeRoute());
            }
          },
          builder: (context, state) {
            return Column(
              children: const [
                SignInEmailInput(),
                SignInPasswordInput(),
                SignInButton(),
              ],
            );
          },
        ),
      ),
    );
  }
}
