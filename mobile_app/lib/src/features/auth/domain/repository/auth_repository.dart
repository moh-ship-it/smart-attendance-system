import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> addUser({
    required String userName,
    required String email,
    required String password,
  });
  Future<UserEntity> logIn({required String email, required String password});
}
