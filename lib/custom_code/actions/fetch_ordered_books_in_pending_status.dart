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
Future<List<OrderedBookStruct>> fetchOrderedBooksInPendingStatus() async {
  List<OrderStruct> orders = [];

  List<OrderedBookStruct> orderedBooks = [];

  final userRef = getCurrentUserReference();

  final db = FirebaseFirestore.instance;

  final ordersRef = db.collection("orders");

  final booksRef = db.collection("books");

  final query = ordersRef
      .where("status", isEqualTo: OrderStatus.Completed)
      .where("user", isEqualTo: userRef)
      .limit(5)
      .get()
      .then((querySnapshot) {
    for (var doc in querySnapshot.docs) {
      var order = OrderStruct.fromMap(doc.data());
      orders.add(order);
    }
  });
  for (var order in orders) {
    List<DocumentReference> bookRefs = List.from(order.books);

    for (var bookRef in bookRefs) {
      DocumentSnapshot bookSnapshot = await bookRef.get();
      if (bookSnapshot.exists) {
        var book = BookStruct.fromMap(bookSnapshot.data());
        orderedBooks.add(OrderedBookStruct(
            author: book.author,
            title: book.title,
            photo: book.photo,
            endDate: order.endDate,
            canBeProlonged: order.prolongations < 3));
      }
    }
  }

  return orderedBooks;
}
