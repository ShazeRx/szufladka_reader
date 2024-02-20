import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BooksRecord extends FirestoreRecord {
  BooksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  bool hasAuthor() => _author != null;

  // "available" field.
  int? _available;
  int get available => _available ?? 0;
  bool hasAvailable() => _available != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "publisher" field.
  String? _publisher;
  String get publisher => _publisher ?? '';
  bool hasPublisher() => _publisher != null;

  // "isbn" field.
  String? _isbn;
  String get isbn => _isbn ?? '';
  bool hasIsbn() => _isbn != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _author = snapshotData['author'] as String?;
    _available = castToType<int>(snapshotData['available']);
    _photo = snapshotData['photo'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _description = snapshotData['description'] as String?;
    _category = snapshotData['category'] as String?;
    _publisher = snapshotData['publisher'] as String?;
    _isbn = snapshotData['isbn'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('books');

  static Stream<BooksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BooksRecord.fromSnapshot(s));

  static Future<BooksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BooksRecord.fromSnapshot(s));

  static BooksRecord fromSnapshot(DocumentSnapshot snapshot) => BooksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BooksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BooksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BooksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BooksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBooksRecordData({
  String? title,
  String? author,
  int? available,
  String? photo,
  double? rating,
  String? description,
  String? category,
  String? publisher,
  String? isbn,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'author': author,
      'available': available,
      'photo': photo,
      'rating': rating,
      'description': description,
      'category': category,
      'publisher': publisher,
      'isbn': isbn,
    }.withoutNulls,
  );

  return firestoreData;
}

class BooksRecordDocumentEquality implements Equality<BooksRecord> {
  const BooksRecordDocumentEquality();

  @override
  bool equals(BooksRecord? e1, BooksRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.author == e2?.author &&
        e1?.available == e2?.available &&
        e1?.photo == e2?.photo &&
        e1?.rating == e2?.rating &&
        e1?.description == e2?.description &&
        e1?.category == e2?.category &&
        e1?.publisher == e2?.publisher &&
        e1?.isbn == e2?.isbn;
  }

  @override
  int hash(BooksRecord? e) => const ListEquality().hash([
        e?.title,
        e?.author,
        e?.available,
        e?.photo,
        e?.rating,
        e?.description,
        e?.category,
        e?.publisher,
        e?.isbn
      ]);

  @override
  bool isValidKey(Object? o) => o is BooksRecord;
}
