import 'package:dartz/dartz.dart';
import 'package:fit_sessions/core/errors/failure.dart';
import 'package:fit_sessions/core/use_case/use_case.dart';
import 'package:fit_sessions/features/home/domain/entities/product.dart';
import 'package:fit_sessions/features/home/domain/repositories/home_repository.dart';

class GetProduct implements UseCase<Product, NoParams> {
  final HomeRepository _repository;

  GetProduct({required HomeRepository repository}) : _repository = repository;
  @override
  Future<Either<Failure, Product>> call(NoParams params) async {
    return await _repository.getProduct();
  }
}
