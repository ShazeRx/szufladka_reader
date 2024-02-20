import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB9nEGEzVeBBtncI8_slMe_HgaHNJje7eA",
            authDomain: "szufladka-9a17b.firebaseapp.com",
            projectId: "szufladka-9a17b",
            storageBucket: "szufladka-9a17b.appspot.com",
            messagingSenderId: "239734479955",
            appId: "1:239734479955:web:7c99352792442787fbbaa6",
            measurementId: "G-3W825HP5HB"));
  } else {
    await Firebase.initializeApp();
  }
}
