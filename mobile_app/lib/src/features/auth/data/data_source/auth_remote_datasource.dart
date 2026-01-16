import 'dart:convert';

import '../../../../core/constants/api_endpoint.dart';
import '../../../../core/network/api_service.dart';
import '../models/user_models.dart';

class AuthRemoteDatasource {
  final ApiService _apiService;
  AuthRemoteDatasource({required ApiService apiService})
    : _apiService = apiService;

  Future<UserModel> addUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiService.post(EndPoint.addUser, {
        'name': name,
        'email': email,
        'password': password,
      });

      final Map<String, dynamic> data = json.decode(response.body);

      if (data['success'] == true) {
        return UserModel.fromJson(data['data']['user']);
      } else {
        throw Exception(data['message'] ?? 'فشل في انشاء الحساب');
      }
    } catch (e) {
      throw Exception(' فشل الاتصال $e ');
    }
  }

  Future<UserModel> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiService.post(EndPoint.logIn, {
        "email": email,
        "password": password,
      });
      final Map<String, dynamic> data = json.decode(response.body);
      print("Login Response: ${response.body}");
      if (data['success'] == true) {
        return UserModel.fromJson(data['data']['user']);
      } else {
        throw Exception(data['message'] ?? 'فشل في تسجيل الدخول');
      }
    } catch (e) {
      throw Exception('فشل الاتصال  :$e  ');
    }
  }
}
