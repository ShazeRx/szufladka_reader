import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void registerDependencies() {
  _registerFirestore(false);
  _registerFirebaseAuth();
}

registerTestDependencies(MockUser mockUser){
  _registerFirestore(true);
  _registerTestFirebaseAuth(mockUser);
}

_registerFirestore(bool testing) {
  getIt.registerLazySingleton<FirebaseFirestore>(
      () => testing ? FakeFirebaseFirestore() : FirebaseFirestore.instance);
}

_registerFirebaseAuth() {
  getIt.registerLazySingleton(()=> FirebaseAuth.instance);
}

_registerTestFirebaseAuth(MockUser mockUser){
  getIt.registerLazySingleton<FirebaseAuth>(
          () => MockFirebaseAuth(signedIn: true, mockUser: mockUser));
}