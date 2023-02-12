import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:szufladka_reader/injection.dart';
import 'package:szufladka_reader/presentation/core/szufladka_app.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(SzufladkaApp());
}
