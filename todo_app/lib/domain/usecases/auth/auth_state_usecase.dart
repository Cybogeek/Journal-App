import '../../entities/app_user_entity.dart';
import '../../repositories/auth_repository.dart';

class AuthStateUseCase {
  final AuthRepository repository;

  AuthStateUseCase(this.repository);

  Stream<AppUserEntity?> call() => repository.authStateChanges();
}
