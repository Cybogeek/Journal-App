import '../../domain/entities/app_user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Stream<AppUserEntity?> authStateChanges() {
    return remoteDataSource.authStateChanges();
  }

  @override
  Future<AppUserEntity> login({
    required String email,
    required String password,
  }) {
    return remoteDataSource.login(email: email, password: password);
  }

  @override
  Future<AppUserEntity> signup({
    required String email,
    required String password,
  }) {
    return remoteDataSource.signup(email: email, password: password);
  }

  @override
  Future<void> logout() {
    return remoteDataSource.logout();
  }
}
