import '../entities/user_entity.dart';
import '../repository/auth_repository.dart';

class LoginUsecase {
  final AuthRepository _repository;
  LoginUsecase({required AuthRepository repository}) : _repository = repository;
  Future<UserEntity> call({
    required String email,
    required String password,
  }) async {
    return await _repository.logIn(email: email, password: password);
  }
}
