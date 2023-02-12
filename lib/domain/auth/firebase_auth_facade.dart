import 'package:szufladka_reader/domain/auth/auth_failure.dart';
import 'package:dartz/dartz.dart';

abstract class FirebaseAuthFacade {
  Future<Either<AuthFailure, Unit>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
