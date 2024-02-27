import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:szufladka/backend/schema/enums/enums.dart';


Future completeOrder(DocumentReference order) async {
  order.update({"status": OrderStatus.Completed.name,"startDate":DateTime.now()});
}