// Automatic FlutterFlow imports
import '../../injection/injector.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

import 'package:firebase_auth/firebase_auth.dart';

Future<DocumentReference> getCurrentUserReference() async {
  final user = getIt<FirebaseAuth>().currentUser!;

  final uid = user.uid;
  final FirebaseFirestore firestore = getIt<FirebaseFirestore>();
  final DocumentReference userRef = firestore.collection('users').doc(uid);
  return userRef;
}
