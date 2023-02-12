import 'package:flutter/material.dart';
import 'package:szufladka_reader/presentation/routes/app_router.gr.dart';

class SzufladkaApp extends StatelessWidget {
  final _appRouter = AppRouter();

  SzufladkaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
