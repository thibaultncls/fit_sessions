import 'package:dartz/dartz.dart';
import 'package:fit_sessions/core/common/entities/user.dart';
import 'package:fit_sessions/core/errors/exception.dart';
import 'package:fit_sessions/core/errors/failure.dart';
import 'package:fit_sessions/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:fit_sessions/features/auth/data/models/auth_user_model.dart';
import 'package:fit_sessions/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

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

  @override
  Future<Either<Failure, User>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String role,
  }) async {
    try {
      final authUserModel = await _remoteDataSource.createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
        role: role,
      );
      return Right(authUserModel.toEntity());
    } on ServerException catch (e) {
      debugPrint('AuthRepositoryImpl: ServerException - ${e.message}');
      return Left(Failure.serverError());
    } on AuthException catch (e) {
      debugPrint('AuthRepositoryImpl: Unauthorized - ${e.message}');

      return Left(Failure.unauthorized());
    } catch (_) {
      return Left(Failure.unknown());
    }
  }

  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final authUserModel = await _remoteDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(authUserModel.toEntity());
    } on ServerException catch (_) {
      return Left(Failure.serverError());
    } on AuthException catch (e) {
      debugPrint('AuthRepositoryImpl: Unauthorized - ${e.toString()}');
      return Left(Failure.unauthorized());
    } catch (_) {
      return Left(Failure.unknown());
    }
  }
}
