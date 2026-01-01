import 'package:dartz/dartz.dart';
import 'package:fit_sessions/core/errors/exception.dart';
import 'package:fit_sessions/core/errors/failure.dart';
import 'package:fit_sessions/features/home/data/data_sources/home_remote_data_sources.dart';
import 'package:fit_sessions/features/home/data/models/product_model.dart';
import 'package:fit_sessions/features/home/domain/entities/product.dart';
import 'package:fit_sessions/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSources _remoteDataSources;

  HomeRepositoryImpl({required HomeRemoteDataSources remoteDataSources})
    : _remoteDataSources = remoteDataSources;

  @override
  Future<Either<Failure, Product>> getProduct() async {
    try {
      final productModel = await _remoteDataSources.fetchProduct();
      return Right(productModel.toEntity());
    } on ServerException catch (_) {
      return Left(Failure.serverError());
    } catch (e) {
      return Left(Failure.unknown());
    }
  }
}
