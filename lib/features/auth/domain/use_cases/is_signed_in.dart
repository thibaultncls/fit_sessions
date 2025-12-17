import 'package:dartz/dartz.dart';
import 'package:fit_sessions/core/errors/failure.dart';
import 'package:fit_sessions/core/use_case/use_case.dart';
import 'package:fit_sessions/features/auth/domain/repositories/auth_repository.dart';

class IsSignedIn implements UseCase<bool, NoParams> {
  final AuthRepository _repository;

  IsSignedIn({required AuthRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await _repository.isSignedIn();
  }
}
