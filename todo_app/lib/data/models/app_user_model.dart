import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/app_user_entity.dart';

class AppUserModel extends AppUserEntity {
  const AppUserModel({required super.uid, required super.email});

  factory AppUserModel.fromFirebaseUser(User user) {
    return AppUserModel(uid: user.uid, email: user.email ?? '');
  }

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': email};
  }
}
