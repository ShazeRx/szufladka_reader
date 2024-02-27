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

Future<OrdersRecord> bookABook(BooksRecord book) async {
  final firestore = getIt<FirebaseFirestore>();
  final ordersRef = firestore.collection("orders");
  final userRef = await getCurrentUserReference();
  final newOrder = createOrdersRecordData(
      startDate: null,
      endDate: null,
      user: userRef,
      dateAdded: DateTime.now(),
      status: OrderStatus.Pending,
      prolongations: 0,
      book: book.reference);

  final newOrderRef = await ordersRef.add(newOrder);

  book.reference.update({"available": book.available - 1});

  final newOrderDoc = await newOrderRef.get();

  return OrdersRecord.fromSnapshot(newOrderDoc);
}
