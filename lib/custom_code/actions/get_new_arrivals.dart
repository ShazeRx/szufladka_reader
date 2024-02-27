import '../../injection/injector.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

Future<List<BooksRecord>> getNewArrivals() async {
  List<BooksRecord> newArrivals = [];
  final firestore = getIt<FirebaseFirestore>();

  final booksCollectionRef = firestore.collection("books");

  final newArrivalsQuery = booksCollectionRef.orderBy("dateAdded").limit(10);

  final newArrivalsSnapshot = await newArrivalsQuery.get();

  for (var doc in newArrivalsSnapshot.docs) {
    var book = BooksRecord.fromSnapshot(doc);
    newArrivals.add(book);
  }

  return newArrivals;
}
