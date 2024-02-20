// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookStruct extends FFFirebaseStruct {
  BookStruct({
    String? photo,
    String? title,
    String? author,
    int? available,
    String? description,
    double? rating,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _photo = photo,
        _title = title,
        _author = author,
        _available = available,
        _description = description,
        _rating = rating,
        super(firestoreUtilData);

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  set photo(String? val) => _photo = val;
  bool hasPhoto() => _photo != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  set author(String? val) => _author = val;
  bool hasAuthor() => _author != null;

  // "available" field.
  int? _available;
  int get available => _available ?? 0;
  set available(int? val) => _available = val;
  void incrementAvailable(int amount) => _available = available + amount;
  bool hasAvailable() => _available != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  set rating(double? val) => _rating = val;
  void incrementRating(double amount) => _rating = rating + amount;
  bool hasRating() => _rating != null;

  static BookStruct fromMap(Map<String, dynamic> data) => BookStruct(
        photo: data['photo'] as String?,
        title: data['title'] as String?,
        author: data['author'] as String?,
        available: castToType<int>(data['available']),
        description: data['description'] as String?,
        rating: castToType<double>(data['rating']),
      );

  static BookStruct? maybeFromMap(dynamic data) =>
      data is Map ? BookStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'photo': _photo,
        'title': _title,
        'author': _author,
        'available': _available,
        'description': _description,
        'rating': _rating,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'photo': serializeParam(
          _photo,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'author': serializeParam(
          _author,
          ParamType.String,
        ),
        'available': serializeParam(
          _available,
          ParamType.int,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'rating': serializeParam(
          _rating,
          ParamType.double,
        ),
      }.withoutNulls;

  static BookStruct fromSerializableMap(Map<String, dynamic> data) =>
      BookStruct(
        photo: deserializeParam(
          data['photo'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        author: deserializeParam(
          data['author'],
          ParamType.String,
          false,
        ),
        available: deserializeParam(
          data['available'],
          ParamType.int,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        rating: deserializeParam(
          data['rating'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'BookStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BookStruct &&
        photo == other.photo &&
        title == other.title &&
        author == other.author &&
        available == other.available &&
        description == other.description &&
        rating == other.rating;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([photo, title, author, available, description, rating]);
}

BookStruct createBookStruct({
  String? photo,
  String? title,
  String? author,
  int? available,
  String? description,
  double? rating,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BookStruct(
      photo: photo,
      title: title,
      author: author,
      available: available,
      description: description,
      rating: rating,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BookStruct? updateBookStruct(
  BookStruct? book, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    book
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBookStructData(
  Map<String, dynamic> firestoreData,
  BookStruct? book,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (book == null) {
    return;
  }
  if (book.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && book.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bookData = getBookFirestoreData(book, forFieldValue);
  final nestedData = bookData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = book.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBookFirestoreData(
  BookStruct? book, [
  bool forFieldValue = false,
]) {
  if (book == null) {
    return {};
  }
  final firestoreData = mapToFirestore(book.toMap());

  // Add any Firestore field values
  book.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBookListFirestoreData(
  List<BookStruct>? books,
) =>
    books?.map((e) => getBookFirestoreData(e, true)).toList() ?? [];
