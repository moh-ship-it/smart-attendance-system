//       محتوى هذا الملف
// فصل التبعيات: كل بروفايدر مستقل

// إدارة الموارد: تنظيف الذاكرة تلقائياً

// حالة عالمية: التوكن والإعدادات متاحة للكل

// مركزية: كل الخدمات الأساسية في مكان واحد

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:http/http.dart' as http show Client;
import 'package:mobile_app/src/core/network/api_service.dart';

import '../constants/api_endpoint.dart';

final httpClintProvider = Provider<http.Client>((ref) {
  final clint = http.Client();
  // تنظيف الموارد
  // تجنب اهدار الذاكرة
  ref.onCancel(() {
    clint.close();
  });
  return clint;
});

// appConfigProvider to allocate all settings of the app
final appConfigProvider = Provider<AppConfig>((ref) {
  return AppConfig(
    environment: Environment.development,
    baseUrl: EndPoint.baseUrl,
    enableLogging: false,
    timeout: Duration(seconds: 30),
  );
});

// auth State
final authTokenProvider = StateProvider<String?>((ref) => null);

// collect all API Services
final apiServiceProvider = Provider<ApiService>((ref) {
  final clint = ref.watch(httpClintProvider);
  final config = ref.watch(appConfigProvider);
  final token = ref.watch(authTokenProvider);
  return ApiService(baseUrl: config.baseUrl, clint: clint, token: token);
});

// the Environment state
enum Environment {
  development, // حالة التطوير
  staging, // حالة الاختبار
  production, // حالة الانتاج
}

// this class to manage all app
class AppConfig {
  final Environment environment;
  final String baseUrl;
  final enableLogging;
  final Duration timeout;
  AppConfig({
    required this.environment,
    required this.baseUrl,
    required this.enableLogging,
    required this.timeout,
  });
}
