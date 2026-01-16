// كلاس لحالات المصادقة
import '../../../auth/domain/entities/user_entity.dart';

sealed class AuthState {
  const AuthState();

  // //   دوال مساعدة
  bool get isLoading => this is AuthLoading;
  bool get isAuthenticated => this is AuthAuthenticated;
  bool get isUnauthenticated => this is AuthUnauthenticated;
  bool get hasError => this is AuthError;

  // الحصول على بيانات المستخدم (اذا كان هناك بيانات)
  UserEntity? get user {
    return switch (this) {
      AuthAuthenticated(user: final user) => user,
      _ => null,
    };
  }

  //    الحصول على الخطاء
  String? get errorMessage {
    return switch (this) {
      AuthError(message: final message) => message,
      _ => null,
    };
  }
}

//  الحالات المختلفة:

// الحالة الاساسية
class AuthInitial extends AuthState {
  const AuthInitial();
}

// عند التحميل : في انشاء حساب او تسجيل دخول
class AuthLoading extends AuthState {
  const AuthLoading();
}

// مسجل الدخول بنجاح: يحتوي على بيانات المستخدم
class AuthAuthenticated extends AuthState {
  final UserEntity user;
  const AuthAuthenticated(this.user);
}

//  غير مسجل الدخول : ولكنه في حالة انه يقوم بتسجيل الدخول
class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

// في حالة حدوث خطا : هذه ستحمل رساله الخطا
class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);
}
