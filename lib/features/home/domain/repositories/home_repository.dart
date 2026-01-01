import 'package:dartz/dartz.dart';
import 'package:fit_sessions/core/errors/failure.dart';
import 'package:fit_sessions/features/home/domain/entities/product.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, Product>> getProduct();
}
