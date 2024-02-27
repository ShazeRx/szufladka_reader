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
    bool? canBeProlonged,
    DocumentReference? book,
    OrderStatus? status,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _endDate = endDate,
        _canBeProlonged = canBeProlonged,
        _book = book,
        _status = status,
        super(firestoreUtilData);

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? val) => _endDate = val;
  bool hasEndDate() => _endDate != null;

  // "canBeProlonged" field.
  bool? _canBeProlonged;
  bool get canBeProlonged => _canBeProlonged ?? false;
  set canBeProlonged(bool? val) => _canBeProlonged = val;
  bool hasCanBeProlonged() => _canBeProlonged != null;

  // "book" field.
  DocumentReference? _book;
  DocumentReference? get book => _book;
  set book(DocumentReference? val) => _book = val;
  bool hasBook() => _book != null;

  // "status" field.
  OrderStatus? _status;
  OrderStatus? get status => _status;
  set status(OrderStatus? val) => _status = val;
  bool hasStatus() => _status != null;

  static OrderedBookStruct fromMap(Map<String, dynamic> data) =>
      OrderedBookStruct(
        endDate: data['endDate'] as DateTime?,
        canBeProlonged: data['canBeProlonged'] as bool?,
        book: data['book'] as DocumentReference?,
        status: deserializeEnum<OrderStatus>(data['status']),
      );

  static OrderedBookStruct? maybeFromMap(dynamic data) => data is Map
      ? OrderedBookStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'endDate': _endDate,
        'canBeProlonged': _canBeProlonged,
        'book': _book,
        'status': _status?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'endDate': serializeParam(
          _endDate,
          ParamType.DateTime,
        ),
        'canBeProlonged': serializeParam(
          _canBeProlonged,
          ParamType.bool,
        ),
        'book': serializeParam(
          _book,
          ParamType.DocumentReference,
        ),
        'status': serializeParam(
          _status,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static OrderedBookStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderedBookStruct(
        endDate: deserializeParam(
          data['endDate'],
          ParamType.DateTime,
          false,
        ),
        canBeProlonged: deserializeParam(
          data['canBeProlonged'],
          ParamType.bool,
          false,
        ),
        book: deserializeParam(
          data['book'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['books'],
        ),
        status: deserializeParam<OrderStatus>(
          data['status'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'OrderedBookStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrderedBookStruct &&
        endDate == other.endDate &&
        canBeProlonged == other.canBeProlonged &&
        book == other.book &&
        status == other.status;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([endDate, canBeProlonged, book, status]);
}

OrderedBookStruct createOrderedBookStruct({
  DateTime? endDate,
  bool? canBeProlonged,
  DocumentReference? book,
  OrderStatus? status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrderedBookStruct(
      endDate: endDate,
      canBeProlonged: canBeProlonged,
      book: book,
      status: status,
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
