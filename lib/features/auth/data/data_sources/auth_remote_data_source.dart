import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_sessions/core/errors/exception.dart';

abstract interface class AuthRemoteDataSource {
  Future<bool> isSignedIn();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthRemoteDataSourceImpl({required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth;

  @override
  Future<bool> isSignedIn() async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      return currentUser != null;
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message ?? 'Firebase Auth Exception');
    } on Exception catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
