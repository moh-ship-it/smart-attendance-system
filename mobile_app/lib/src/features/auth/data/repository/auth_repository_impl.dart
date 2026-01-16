import '../../domain/entities/user_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_remote_datasource.dart';
import '../models/user_models.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource _datasource;
  AuthRepositoryImpl({required AuthRemoteDatasource datasource})
    : _datasource = datasource;
  @override
  Future<UserEntity> logIn({
    required String email,
    required String password,
  }) async {
    try {
      UserModel userModel = await _datasource.logIn(
        email: email,
        password: password,
      );
      return userModel.toEntity();
    } catch (e) {
      throw Exception('فشل في تسجيل الدخول $e');
    }
  }

  @override
  Future<UserEntity> addUser({
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      UserModel userModel = await _datasource.addUser(
        name: userName,
        email: email,
        password: password,
      );
      return userModel.toEntity();
    } catch (e) {
      throw Exception('فشل في اضافة المستخدم $e');
    }
  }
}
