// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

import 'package:firebase_auth/firebase_auth.dart';

Future<DocumentReference> getCurrentUserReference() async {
  final user = FirebaseAuth.instance.currentUser!!;

  final uid = user.uid;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final DocumentReference userRef = firestore.collection('users').doc(uid);
  return userRef;
}
