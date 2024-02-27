import '../../injection/injector.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart';
import 'package:flutter/material.dart';
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
