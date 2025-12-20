import 'package:dartz/dartz.dart';
import 'package:fit_sessions/core/common/entities/user.dart';
import 'package:fit_sessions/core/errors/failure.dart';
import 'package:fit_sessions/core/use_case/use_case.dart';
import 'package:fit_sessions/features/auth/domain/repositories/auth_repository.dart';
import 'package:fit_sessions/features/auth/presentation/providers/role_provider.dart';

class Register implements UseCase<User, RegisterParams> {
  final AuthRepository _repository;

  const Register({required AuthRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, User>> call(RegisterParams params) async {
    return await _repository.createUserWithEmailAndPassword(
      email: params.email,
      password: params.password,
      name: params.username,
      role: params.role.name,
    );
  }
}

class RegisterParams {
  final String email;
  final String password;
  final String username;
  final RegisterRole role;

  RegisterParams({required this.email, required this.password, required this.username, required this.role});
}
