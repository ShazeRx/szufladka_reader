import '../../injection/injector.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

Future<List<OrderedBookStruct>> fetchOrderedBooksInStatuses(
    List<OrderStatus> statusList) async {
  List<OrdersRecord> orders = [];

  List<OrderedBookStruct> orderedBooks = [];

  final userRef = await getCurrentUserReference();

  final db = getIt<FirebaseFirestore>();

  final ordersRef = db.collection("orders");

  var query = ordersRef
      .where("user", isEqualTo: userRef)
      .where("status",
          whereIn: statusList.map(
            (status) => status.name,
          ))
      .limit(5);

  final snapshot = await query.get();

  for (var doc in snapshot.docs) {
    var order = OrdersRecord.fromSnapshot(doc);
    orders.add(order);
  }

  for (var order in orders) {
    DocumentReference bookRef = order.book!;
    orderedBooks.add(OrderedBookStruct(
        book: bookRef,
        endDate: order.endDate,
        status: order.status,
        canBeProlonged: order.prolongations < 3));
  }

  return orderedBooks;
}
