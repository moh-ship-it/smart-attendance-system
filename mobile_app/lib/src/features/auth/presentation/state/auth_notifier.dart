import 'package:flutter_riverpod/legacy.dart';
import 'package:mobile_app/src/features/auth/domain/usecases/add_user_usecase.dart';

import '../../../auth/domain/usecases/login_usecase.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUsecase _loginUsecase;
  final AddUserUsecase _addUserUsecase;
  AuthNotifier({
    required LoginUsecase loginUsecase,
    required AddUserUsecase addUserUsecase,
  }) : _loginUsecase = loginUsecase,
       _addUserUsecase = addUserUsecase,
       super(const AuthInitial());

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AuthLoading();
    try {
      final user = await _addUserUsecase(
        userName: name,
        email: email,
        password: password,
      );
      state = AuthAuthenticated(user);
    } catch (error) {
      state = AuthError('$error فشل انشاء الحساب  ');
    }
  }

  Future<void> logIn({required String email, required String password}) async {
    state = const AuthLoading();
    try {
      final user = await _loginUsecase(email: email, password: password);
      state = AuthAuthenticated(user);
    } catch (error) {
      state = AuthError('$error فشل تسجيل الدخول : ');
    }
  }
}
