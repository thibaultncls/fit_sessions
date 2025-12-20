import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_sessions/core/errors/exception.dart';
import 'package:fit_sessions/features/auth/data/models/auth_user_model.dart';
import 'package:flutter/widgets.dart';

abstract interface class AuthRemoteDataSource {
  Future<bool> isSignedIn();
  Future<AuthUserModel> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String role,
  });
  Future<AuthUserModel> signInWithEmailAndPassword({required String email, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthRemoteDataSourceImpl({required FirebaseAuth firebaseAuth, required FirebaseFirestore firestore})
    : _firebaseAuth = firebaseAuth,
      _firestore = firestore;

  @override
  Future<bool> isSignedIn() async {
    try {
      // await _firebaseAuth.signOut();
      final currentUser = _firebaseAuth.currentUser;

      return currentUser != null;
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message ?? 'Firebase Auth Exception');
    } on Exception catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<AuthUserModel> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String role,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        final userModel = AuthUserModel(uid: user.uid, email: email, name: name, role: role);
        await _firestore.collection('users').doc(user.uid).set(userModel.toJson());
        return userModel;
      } else {
        throw AuthException(message: 'User not found after sign up');
      }
    } on FirebaseAuthException catch (e) {
      debugPrint('AuthRemoteDataSourceImpl: FirebaseAuthException - ${e.message}');
      throw AuthException(message: e.message ?? 'Firebase Auth Exception');
    } on Exception catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<AuthUserModel> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user;
      if (user != null) {
        final userDoc = await _firestore.collection('users').doc(user.uid).get();
        return AuthUserModel.fromJson(userDoc.data()!);
      } else {
        throw AuthException(message: 'User not found after sign in');
      }
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message ?? 'Firebase Auth Exception');
    } on Exception catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
