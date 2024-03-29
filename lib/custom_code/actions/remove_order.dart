import '../../injection/injector.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

Future removeOrder(DocumentReference orderRef) async {

  final orderSnapshot = await orderRef.get();

  final order = OrdersRecord.fromSnapshot(orderSnapshot);

  final bookRef = order.book!;

  final bookSnapshot = await bookRef.get();

  final book = BooksRecord.fromSnapshot(bookSnapshot);

  final available = book.available + 1;

  order.reference.delete();

  book.reference.update({"available": available});
}
