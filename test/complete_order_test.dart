import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:szufladka/backend/backend.dart';
import 'package:szufladka/backend/schema/books_record.dart';
import 'package:szufladka/backend/schema/enums/enums.dart';
import 'package:szufladka/custom_code/actions/complete_order.dart';
import 'package:szufladka/injection/injector.dart';

late FirebaseFirestore firestore;
late MockUser mockUser;
const bookUid = "321";
const userUid = "123";

void main() {
  mockUser = MockUser(
    isAnonymous: false,
    uid: '123',
    email: 'test@test.com',
    displayName: 'John',
  );

  final testBook = createBooksRecordData(
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
  );

  setUp(() async {
    registerTestDependencies(mockUser);
    firestore = getIt<FirebaseFirestore>();

    await firestore.collection('users').doc("123").set({
      'username': 'John',
      'email': 'test@test.com',
    });

    firestore.collection('books').doc(bookUid).set(testBook);
  });

  test("should complete the order", () async {
    //Arrange
    final userRef = firestore.collection('users').doc(userUid);

    final book = await BooksRecord.collection
        .doc(bookUid)
        .get()
        .then((s) => BooksRecord.fromSnapshot(s));

    final orderRef = await firestore.collection('orders').add(createOrdersRecordData(
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 2)),
      user: userRef,
      book: book.reference,
      status: OrderStatus.Pending,
      prolongations: 0,
      dateAdded: DateTime.now(),
    ));

    //Act
    await completeOrder(orderRef);

    //Assert
    final order =await OrdersRecord.getDocumentOnce(orderRef);

    expect(order.status, OrderStatus.Completed);
  });
}