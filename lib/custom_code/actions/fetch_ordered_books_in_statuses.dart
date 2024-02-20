// Automatic FlutterFlow imports
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
Future<List<OrderedBookStruct>> fetchOrderedBooksInStatuses(
    List<OrderStatus> statusList) async {
  List<OrdersRecord> orders = [];

  List<OrderedBookStruct> orderedBooks = [];

  final userRef = await getCurrentUserReference();

  final db = FirebaseFirestore.instance;

  final ordersRef = db.collection("orders");

  final query = ordersRef.where("user", isEqualTo: userRef).limit(5);

  for (status in statusList) {
    query = query.where("status", isEqualTo: status.name);
  }

  final snapshot = await query.get();

  for (var doc in snapshot.docs) {
    var order = OrdersRecord.fromSnapshot(doc);
    orders.add(order);
  }

  for (var order in orders) {
    DocumentReference bookRef = order.book;
    orderedBooks.add(OrderedBookStruct(
        book: bookRef,
        endDate: order.endDate,
        canBeProlonged: order.prolongations < 3));
  }

  return orderedBooks;
}
