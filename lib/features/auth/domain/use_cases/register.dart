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
    if (params.email.isEmpty ||
        params.password.isEmpty ||
        params.confirmPassword.isEmpty ||
        params.username.isEmpty) {
      return Left(Failure.validationError('Tous les champs sont obligatoires.'));
    }

    if (params.confirmPassword != params.password) {
      return Left(Failure.validationError('Les mots de passe ne correspondent pas.'));
    }

    if (params.password.length < 8) {
      return Left(Failure.validationError('Le mot de passe doit contenir au moins 8 caractères.'));
    }

    if (params.username.length < 3) {
      return Left(Failure.validationError("Le nom d'utilisateur doit contenir au moins 3 caractères."));
    }

    if (!_isValidEmail(params.email)) {
      return Left(Failure.validationError("L'adresse e-mail n'est pas valide."));
    }

    if (params.role != RegisterRole.client && params.role != RegisterRole.coach) {
      return Left(Failure.validationError('Le rôle sélectionné n\'est pas valide.'));
    }

    return await _repository.createUserWithEmailAndPassword(
      email: params.email,
      password: params.password,
      name: params.username,
      role: params.role.name,
    );
  }

  bool _isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    return emailRegex.hasMatch(email);
  }
}

class RegisterParams {
  final String email;
  final String password;
  final String confirmPassword;
  final String username;
  final RegisterRole role;

  RegisterParams({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.username,
    required this.role,
  });
}
