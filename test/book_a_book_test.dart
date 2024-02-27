import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:szufladka/backend/backend.dart';
import 'package:szufladka/backend/schema/enums/enums.dart';
import 'package:szufladka/custom_code/actions/book_a_book.dart';
import 'package:szufladka/injection/injector.dart';

import 'remove_order_test.dart';

late FirebaseFirestore firestore;

const bookUid = "321";

void main() {
  setUp(() async {
    final mockUser = MockUser(
      isAnonymous: false,
      uid: '123',
      email: 'test@test.com',
      displayName: 'John',
    );
    registerTestDependencies(mockUser);
    firestore = getIt<FirebaseFirestore>();

    await firestore.collection('users').doc("123").set({
      'username': 'John',
      'email': 'test@test.com',
    });
  });
  test("should book a book", () async {
    //Arrange
    firestore.collection('books').doc(bookUid).set(createBooksRecordData(
          title: "Wiedźmin",
          author: "Andrzej Sapkowski",
          available: 3,
          photo: "test/image.png",
          rating: 3.2,
          description: "Lorem Ipsum",
          category: "Fantasy",
          publisher: "SuperNowa",
          isbn: "9803809",
          language: "Polski",
          dateAdded: DateTime.now(),
        ));
    final book = await BooksRecord.collection
        .doc(bookUid)
        .get()
        .then((s) => BooksRecord.fromSnapshot(s));

    //Act
    final result = await bookABook(book);

    //Assert
    expect(result.book, book.reference);
    expect(result.dateAdded, isNotNull);
    expect(result.status, OrderStatus.Pending);
    expect(result.prolongations, 0);
  });
}
