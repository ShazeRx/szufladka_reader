import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:szufladka_reader/presentation/routes/app_router.gr.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [
        SignInRoute(),
        SignUpRoute(),
      ],
      builder: (context, child, controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Text("Szufladka"),
                TabBar(
                  controller: controller,
                  tabs: [
                    Tab(text: 'Sign In'),
                    Tab(text: 'Sign Up'),
                  ],
                ),
                Expanded(child: child),
              ],
            ),
          ),
        );
      },
    );
  }
}
