import 'package:dartz/dartz.dart';
import 'package:fit_sessions/core/errors/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, bool>> isSignedIn();
}
