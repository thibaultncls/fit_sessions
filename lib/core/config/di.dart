import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_sessions/core/router/guards/auth_guard.dart';
import 'package:fit_sessions/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:fit_sessions/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fit_sessions/features/auth/domain/repositories/auth_repository.dart';
import 'package:fit_sessions/features/auth/domain/use_cases/is_signed_in.dart';
import 'package:fit_sessions/features/auth/presentation/providers/register_provider.dart';
import 'package:fit_sessions/features/auth/presentation/providers/role_provider.dart';
import 'package:get_it/get_it.dart';

class DI {
  DI._();

  static final GetIt _instance = GetIt.instance;

  static GetIt get instance => _instance;

  static Future<void> init() async {
    // register Firebase
    _instance.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
    _instance.registerLazySingleton(() => FirebaseFirestore.instance);

    _instance
      ..registerFactory<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(firebaseAuth: _instance(), firestore: _instance()),
      )
      ..registerFactory<AuthRepository>(() => AuthRepositoryImpl(remoteDataSource: _instance()))
      ..registerFactory(() => IsSignedIn(repository: _instance()))
      ..registerLazySingleton(() => RoleProvider())
      ..registerLazySingleton(() => RegisterProvider(role: _instance()));

    _instance.registerFactory<AuthGuard>(() => AuthGuard(isSignedIn: _instance()));
  }
}
