import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_sessions/core/router/guards/auth_guard.dart';
import 'package:fit_sessions/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:fit_sessions/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fit_sessions/features/auth/domain/repositories/auth_repository.dart';
import 'package:fit_sessions/features/auth/domain/use_cases/is_signed_in.dart';
import 'package:fit_sessions/features/auth/domain/use_cases/register.dart';
import 'package:fit_sessions/features/auth/presentation/providers/register_provider.dart';
import 'package:fit_sessions/features/auth/presentation/providers/role_provider.dart';
import 'package:fit_sessions/features/home/data/data_sources/home_remote_data_sources.dart';
import 'package:fit_sessions/features/home/data/repositories/home_repository_impl.dart';
import 'package:fit_sessions/features/home/domain/repositories/home_repository.dart';
import 'package:fit_sessions/features/home/domain/use_cases/get_product.dart';
import 'package:fit_sessions/features/home/presentation/providers/get_product_provider.dart';
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
      ..registerFactory(() => Register(repository: _instance()))
      ..registerLazySingleton(() => RoleProvider())
      ..registerLazySingleton(() => RegisterProvider(registerUseCase: _instance()));

    _instance
      ..registerFactory<HomeRemoteDataSources>(() => HomeRemoteDataSourcesImpl(firestore: _instance()))
      ..registerFactory<HomeRepository>(() => HomeRepositoryImpl(remoteDataSources: _instance()))
      ..registerFactory(() => GetProduct(repository: _instance()))
      ..registerLazySingleton(() => GetProductProvider(getProductUseCase: _instance()));

    _instance.registerFactory<AuthGuard>(() => AuthGuard(isSignedIn: _instance()));
  }
}
