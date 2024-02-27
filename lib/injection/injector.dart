import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void registerDependencies({testing = false}) {
  _registerFirestore(testing);
}

_registerFirestore(bool testing) {
  getIt.registerLazySingleton<FirebaseFirestore>(
      () => testing ? FakeFirebaseFirestore() : FirebaseFirestore.instance);
}