import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

Future<UsersRecord?> getUserDocByUid(String uid) async {
  final userDoc =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();
  if (userDoc.exists) return UsersRecord.fromSnapshot(userDoc);
  return null;
}
