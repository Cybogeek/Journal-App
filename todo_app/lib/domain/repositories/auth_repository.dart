import '../entities/app_user_entity.dart';

abstract class AuthRepository {
  Stream<AppUserEntity?> authStateChanges();

  Future<AppUserEntity> signup({
    required String email,
    required String password,
  });

  Future<AppUserEntity> login({
    required String email,
    required String password,
  });

  Future<void> logout();
}
