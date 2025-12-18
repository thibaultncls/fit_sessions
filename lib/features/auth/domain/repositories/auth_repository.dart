import 'package:dartz/dartz.dart';
import 'package:fit_sessions/core/common/entities/user.dart';
import 'package:fit_sessions/core/errors/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, bool>> isSignedIn();
  Future<Either<Failure, User>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<Failure, User>> signInWithEmailAndPassword({required String email, required String password});
}
