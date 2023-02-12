import 'package:auto_route/annotations.dart';
import 'package:szufladka_reader/presentation/auth/auth_page.dart';
import 'package:szufladka_reader/presentation/auth/sign_in/sign_in_page.dart';
import 'package:szufladka_reader/presentation/auth/sign_up/sign_up_page.dart';
import 'package:szufladka_reader/presentation/home/home_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomePage,
    ),
    AutoRoute(
      page: AuthPage,
      initial: true,
      path: "/auth",
      children: [
        AutoRoute(
          path: "sign-in",
          page: SignInPage,
        ),
        AutoRoute(
          path: "sign-up",
          page: SignUpPage,
        )
      ],
    ),
  ],
)
class $AppRouter {}
