import '../../entities/app_user_entity.dart';
import '../../repositories/auth_repository.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase(this.repository);

  Future<AppUserEntity> call({
    required String email,
    required String password,
  }) {
    return repository.signup(email: email, password: password);
  }
}
