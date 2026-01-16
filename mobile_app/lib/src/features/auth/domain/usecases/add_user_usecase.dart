import '../entities/user_entity.dart';
import '../repository/auth_repository.dart';

class AddUserUsecase {
  final AuthRepository _repository;
  AddUserUsecase({required AuthRepository repository})
    : _repository = repository;
  Future<UserEntity> call({
    required String userName,
    required String email,
    required String password,
  }) async {
    return await _repository.addUser(
      userName: userName,
      email: email,
      password: password,
    );
  }
}
