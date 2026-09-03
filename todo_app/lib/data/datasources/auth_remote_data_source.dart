import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/constants/firestore_constants.dart';
import '../../core/error/app_exception.dart';
import '../models/app_user_model.dart';

abstract class AuthRemoteDataSource {
  Stream<AppUserModel?> authStateChanges();

  Future<AppUserModel> signup({
    required String email,
    required String password,
  });

  Future<AppUserModel> login({required String email, required String password});

  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  @override
  Stream<AppUserModel?> authStateChanges() {
    return firebaseAuth.authStateChanges().map((user) {
      if (user == null) return null;
      return AppUserModel.fromFirebaseUser(user);
    });
  }

  @override
  Future<AppUserModel> signup({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      if (user == null) {
        throw AppException('Signup failed');
      }

      final appUser = AppUserModel.fromFirebaseUser(user);

      await firestore
          .collection(FirestoreConstants.usersCollection)
          .doc(user.uid)
          .set({
            FirestoreConstants.uid: appUser.uid,
            FirestoreConstants.email: appUser.email,
            FirestoreConstants.createdAt: FieldValue.serverTimestamp(),
          });

      return appUser;
    } on FirebaseAuthException catch (e) {
      throw AppException(e.message ?? 'Authentication failed');
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  @override
  Future<AppUserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      if (user == null) {
        throw AppException('Login failed');
      }

      return AppUserModel.fromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      throw AppException(e.message ?? 'Authentication failed');
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }
}
