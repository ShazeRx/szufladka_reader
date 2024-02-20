// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderStruct extends FFFirebaseStruct {
  OrderStruct({
    DocumentReference? user,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? dateAdded,
    OrderStatus? status,
    int? prolongations,
    DocumentReference? book,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _user = user,
        _startDate = startDate,
        _endDate = endDate,
        _dateAdded = dateAdded,
        _status = status,
        _prolongations = prolongations,
        _book = book,
        super(firestoreUtilData);

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;
  bool hasUser() => _user != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? val) => _startDate = val;
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? val) => _endDate = val;
  bool hasEndDate() => _endDate != null;

  // "dateAdded" field.
  DateTime? _dateAdded;
  DateTime? get dateAdded => _dateAdded;
  set dateAdded(DateTime? val) => _dateAdded = val;
  bool hasDateAdded() => _dateAdded != null;

  // "status" field.
  OrderStatus? _status;
  OrderStatus get status => _status ?? OrderStatus.Pending;
  set status(OrderStatus? val) => _status = val;
  bool hasStatus() => _status != null;

  // "prolongations" field.
  int? _prolongations;
  int get prolongations => _prolongations ?? 0;
  set prolongations(int? val) => _prolongations = val;
  void incrementProlongations(int amount) =>
      _prolongations = prolongations + amount;
  bool hasProlongations() => _prolongations != null;

  // "book" field.
  DocumentReference? _book;
  DocumentReference? get book => _book;
  set book(DocumentReference? val) => _book = val;
  bool hasBook() => _book != null;

  static OrderStruct fromMap(Map<String, dynamic> data) => OrderStruct(
        user: data['user'] as DocumentReference?,
        startDate: data['startDate'] as DateTime?,
        endDate: data['endDate'] as DateTime?,
        dateAdded: data['dateAdded'] as DateTime?,
        status: deserializeEnum<OrderStatus>(data['status']),
        prolongations: castToType<int>(data['prolongations']),
        book: data['book'] as DocumentReference?,
      );

  static OrderStruct? maybeFromMap(dynamic data) =>
      data is Map ? OrderStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'user': _user,
        'startDate': _startDate,
        'endDate': _endDate,
        'dateAdded': _dateAdded,
        'status': _status?.serialize(),
        'prolongations': _prolongations,
        'book': _book,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
        'startDate': serializeParam(
          _startDate,
          ParamType.DateTime,
        ),
        'endDate': serializeParam(
          _endDate,
          ParamType.DateTime,
        ),
        'dateAdded': serializeParam(
          _dateAdded,
          ParamType.DateTime,
        ),
        'status': serializeParam(
          _status,
          ParamType.Enum,
        ),
        'prolongations': serializeParam(
          _prolongations,
          ParamType.int,
        ),
        'book': serializeParam(
          _book,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static OrderStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderStruct(
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        startDate: deserializeParam(
          data['startDate'],
          ParamType.DateTime,
          false,
        ),
        endDate: deserializeParam(
          data['endDate'],
          ParamType.DateTime,
          false,
        ),
        dateAdded: deserializeParam(
          data['dateAdded'],
          ParamType.DateTime,
          false,
        ),
        status: deserializeParam<OrderStatus>(
          data['status'],
          ParamType.Enum,
          false,
        ),
        prolongations: deserializeParam(
          data['prolongations'],
          ParamType.int,
          false,
        ),
        book: deserializeParam(
          data['book'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['books'],
        ),
      );

  @override
  String toString() => 'OrderStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrderStruct &&
        user == other.user &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        dateAdded == other.dateAdded &&
        status == other.status &&
        prolongations == other.prolongations &&
        book == other.book;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([user, startDate, endDate, dateAdded, status, prolongations, book]);
}

OrderStruct createOrderStruct({
  DocumentReference? user,
  DateTime? startDate,
  DateTime? endDate,
  DateTime? dateAdded,
  OrderStatus? status,
  int? prolongations,
  DocumentReference? book,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrderStruct(
      user: user,
      startDate: startDate,
      endDate: endDate,
      dateAdded: dateAdded,
      status: status,
      prolongations: prolongations,
      book: book,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrderStruct? updateOrderStruct(
  OrderStruct? order, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    order
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrderStructData(
  Map<String, dynamic> firestoreData,
  OrderStruct? order,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (order == null) {
    return;
  }
  if (order.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && order.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final orderData = getOrderFirestoreData(order, forFieldValue);
  final nestedData = orderData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = order.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrderFirestoreData(
  OrderStruct? order, [
  bool forFieldValue = false,
]) {
  if (order == null) {
    return {};
  }
  final firestoreData = mapToFirestore(order.toMap());

  // Add any Firestore field values
  order.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrderListFirestoreData(
  List<OrderStruct>? orders,
) =>
    orders?.map((e) => getOrderFirestoreData(e, true)).toList() ?? [];
