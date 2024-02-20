import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "dateAdded" field.
  DateTime? _dateAdded;
  DateTime? get dateAdded => _dateAdded;
  bool hasDateAdded() => _dateAdded != null;

  // "status" field.
  OrderStatus? _status;
  OrderStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "prolongations" field.
  int? _prolongations;
  int get prolongations => _prolongations ?? 0;
  bool hasProlongations() => _prolongations != null;

  // "book" field.
  DocumentReference? _book;
  DocumentReference? get book => _book;
  bool hasBook() => _book != null;

  void _initializeFields() {
    _startDate = snapshotData['startDate'] as DateTime?;
    _endDate = snapshotData['endDate'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _dateAdded = snapshotData['dateAdded'] as DateTime?;
    _status = deserializeEnum<OrderStatus>(snapshotData['status']);
    _prolongations = castToType<int>(snapshotData['prolongations']);
    _book = snapshotData['book'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  DateTime? startDate,
  DateTime? endDate,
  DocumentReference? user,
  DateTime? dateAdded,
  OrderStatus? status,
  int? prolongations,
  DocumentReference? book,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'startDate': startDate,
      'endDate': endDate,
      'user': user,
      'dateAdded': dateAdded,
      'status': status,
      'prolongations': prolongations,
      'book': book,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.user == e2?.user &&
        e1?.dateAdded == e2?.dateAdded &&
        e1?.status == e2?.status &&
        e1?.prolongations == e2?.prolongations &&
        e1?.book == e2?.book;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.startDate,
        e?.endDate,
        e?.user,
        e?.dateAdded,
        e?.status,
        e?.prolongations,
        e?.book
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
