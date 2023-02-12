import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:szufladka_reader/domain/auth/auth_failure.dart';
import 'package:szufladka_reader/domain/auth/firebase_auth_facade.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:szufladka_reader/infrastracture/auth/auth_failure_messages.dart';

@LazySingleton(as: FirebaseAuthFacade)
class FirebaseAuthFacadeImpl implements FirebaseAuthFacade {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthFacadeImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  Future<Either<AuthFailure, Unit>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(_handleAuthError(e));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(_handleAuthError(e));
    }
  }

  AuthFailure _handleAuthError(FirebaseAuthException exception) {
    return authFailureMessages[exception.code] ??
        const AuthFailure.unexpected();
  }
}
