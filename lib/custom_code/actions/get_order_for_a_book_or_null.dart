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

Future<DocumentReference?> getOrderForABookOrNull(
    DocumentReference book) async {
  final userRef = await getCurrentUserReference();

  final firestore = getIt<FirebaseFirestore>();

  final ordersRef = firestore.collection("orders");

  final query = ordersRef
      .where("user", isEqualTo: userRef)
      .where("book", isEqualTo: book)
      .where("status", whereIn: [
    OrderStatus.Pending.name,
    OrderStatus.Completed.name
  ]).limit(1);

  final snapshot = await query.get();

  if (snapshot.size != 0) {
    return snapshot.docs[0].reference;
  }
  return null;
}
