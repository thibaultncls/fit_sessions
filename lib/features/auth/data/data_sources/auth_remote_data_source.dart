import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRemoteDataSource {
  Future<bool> isSignedIn();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthRemoteDataSourceImpl({required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth;

  @override
  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }
}
