import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:szufladka/backend/backend.dart';
import 'package:szufladka/custom_code/actions/get_new_arrivals.dart';
import 'package:szufladka/injection/injector.dart';

late FirebaseFirestore firestore;

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

  test("should return new arrivals", () async {
    //Arrange
    var theOldestBook;
    for (var i = 0; i < 11; i++) {
      final book =
          await firestore.collection('books').add(createBooksRecordData(
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
                dateAdded: DateTime.now().add(Duration(days: i + 1)),
              ));
      if (i == 10) theOldestBook = BooksRecord.getDocumentOnce(book);
    }
    //Act
    final result = await getNewArrivals();

    //Assert
    expect(result.length, 10);
    expect(result, isNot(contains(theOldestBook)));
  });
}
