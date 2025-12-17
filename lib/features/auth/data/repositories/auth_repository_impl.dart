import 'package:dartz/dartz.dart';
import 'package:fit_sessions/core/errors/exception.dart';
import 'package:fit_sessions/core/errors/failure.dart';
import 'package:fit_sessions/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:fit_sessions/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl({required AuthRemoteDataSource remoteDataSource}) : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, bool>> isSignedIn() async {
    try {
      final isSignedIn = await _remoteDataSource.isSignedIn();
      return Right(isSignedIn);
    } on ServerException catch (_) {
      return Left(Failure.serverError());
    } on AuthException catch (_) {
      return Left(Failure.unauthorized());
    } catch (_) {
      return Left(Failure.unknown());
    }
  }
}
