// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderedBookStruct extends FFFirebaseStruct {
  OrderedBookStruct({
    DateTime? endDate,
    String? title,
    String? author,
    bool? canBeProlonged,
    String? photo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _endDate = endDate,
        _title = title,
        _author = author,
        _canBeProlonged = canBeProlonged,
        _photo = photo,
        super(firestoreUtilData);

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? val) => _endDate = val;
  bool hasEndDate() => _endDate != null;

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

  // "canBeProlonged" field.
  bool? _canBeProlonged;
  bool get canBeProlonged => _canBeProlonged ?? false;
  set canBeProlonged(bool? val) => _canBeProlonged = val;
  bool hasCanBeProlonged() => _canBeProlonged != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  set photo(String? val) => _photo = val;
  bool hasPhoto() => _photo != null;

  static OrderedBookStruct fromMap(Map<String, dynamic> data) =>
      OrderedBookStruct(
        endDate: data['endDate'] as DateTime?,
        title: data['title'] as String?,
        author: data['author'] as String?,
        canBeProlonged: data['canBeProlonged'] as bool?,
        photo: data['photo'] as String?,
      );

  static OrderedBookStruct? maybeFromMap(dynamic data) => data is Map
      ? OrderedBookStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'endDate': _endDate,
        'title': _title,
        'author': _author,
        'canBeProlonged': _canBeProlonged,
        'photo': _photo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'endDate': serializeParam(
          _endDate,
          ParamType.DateTime,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'author': serializeParam(
          _author,
          ParamType.String,
        ),
        'canBeProlonged': serializeParam(
          _canBeProlonged,
          ParamType.bool,
        ),
        'photo': serializeParam(
          _photo,
          ParamType.String,
        ),
      }.withoutNulls;

  static OrderedBookStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderedBookStruct(
        endDate: deserializeParam(
          data['endDate'],
          ParamType.DateTime,
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
        canBeProlonged: deserializeParam(
          data['canBeProlonged'],
          ParamType.bool,
          false,
        ),
        photo: deserializeParam(
          data['photo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OrderedBookStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrderedBookStruct &&
        endDate == other.endDate &&
        title == other.title &&
        author == other.author &&
        canBeProlonged == other.canBeProlonged &&
        photo == other.photo;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([endDate, title, author, canBeProlonged, photo]);
}

OrderedBookStruct createOrderedBookStruct({
  DateTime? endDate,
  String? title,
  String? author,
  bool? canBeProlonged,
  String? photo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrderedBookStruct(
      endDate: endDate,
      title: title,
      author: author,
      canBeProlonged: canBeProlonged,
      photo: photo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrderedBookStruct? updateOrderedBookStruct(
  OrderedBookStruct? orderedBook, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    orderedBook
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrderedBookStructData(
  Map<String, dynamic> firestoreData,
  OrderedBookStruct? orderedBook,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (orderedBook == null) {
    return;
  }
  if (orderedBook.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && orderedBook.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final orderedBookData =
      getOrderedBookFirestoreData(orderedBook, forFieldValue);
  final nestedData =
      orderedBookData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = orderedBook.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrderedBookFirestoreData(
  OrderedBookStruct? orderedBook, [
  bool forFieldValue = false,
]) {
  if (orderedBook == null) {
    return {};
  }
  final firestoreData = mapToFirestore(orderedBook.toMap());

  // Add any Firestore field values
  orderedBook.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrderedBookListFirestoreData(
  List<OrderedBookStruct>? orderedBooks,
) =>
    orderedBooks?.map((e) => getOrderedBookFirestoreData(e, true)).toList() ??
    [];
