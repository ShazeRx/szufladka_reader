import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:szufladka_reader/application/auth/sign_up/sign_up_cubit.dart';
import 'package:szufladka_reader/injection.dart';
import 'package:szufladka_reader/presentation/auth/sign_up/widgets/sign_up_button.dart';
import 'package:szufladka_reader/presentation/auth/sign_up/widgets/sign_up_email_input.dart';
import 'package:szufladka_reader/presentation/auth/sign_up/widgets/sign_up_password_input.dart';
import 'package:szufladka_reader/presentation/routes/app_router.gr.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignUpCubit>(),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocConsumer<SignUpCubit, SignUpState>(
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
                SignUpEmailInput(),
                SignUpPasswordInput(),
                SignUpButton(),
              ],
            );
          },
        ),
      ),
    );
  }
}
