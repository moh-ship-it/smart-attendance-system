import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants/api_endpoint.dart';

class ApiService {
  final String baseUrl;
  final http.Client clint;
  final String? token;

  ApiService({required this.baseUrl, required this.clint, this.token});

  // headers
  Map<String, String> get _headers {
    Map<String, String> headers = {
      // 'content-type': 'application/json',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  //  كل طلبات ال HTTP

  Future<http.Response> get(
    String endpoint, {
    Map<String, dynamic>? params,
  }) async {
    final url = EndPoint.buildUrl(endpoint, params);
    final response = await clint.get(Uri.parse(url), headers: _headers);
    return _handleResponse(response);
  }

  Future<http.Response> post(String endpoint, dynamic data) async {
    final url = EndPoint.buildUrl(endpoint);
    final response = await http.post(
      Uri.parse(url),
      headers: _headers,
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  //method to handel Exceptions
  http.Response _handleResponse(http.Response respons) {
    switch (respons.statusCode) {
      case 200:
      case 201:
        return respons;
      case 400:
        throw BadRequestException(respons.body);
      case 401:
        throw UnauthorizedException('Unauthorized access');
      case 403:
        throw ForbiddenException('Access forbidden');
      case 404:
        throw NotFoundException('Resource not found');
      case 500:
        throw ServerException('Internal server error');
      default:
        throw HttpException(
          'HTTP ${respons.statusCode}: ${respons.body}',

          statusCode: respons.statusCode,
        );
    }
  }
}

// معالجة الاخطاء
// استثناءات مخصصة
class HttpException implements Exception {
  final String message;
  final int? statusCode;
  HttpException(this.message, {this.statusCode});
  @override
  String toString() => 'HttpException:$message';
}

class BadRequestException extends HttpException {
  BadRequestException(String message) : super(message, statusCode: 400);
}

class UnauthorizedException extends HttpException {
  UnauthorizedException(String message) : super(message, statusCode: 401);
}

class ForbiddenException extends HttpException {
  ForbiddenException(String message) : super(message, statusCode: 403);
}

class NotFoundException extends HttpException {
  NotFoundException(String message) : super(message, statusCode: 404);
}

class ServerException extends HttpException {
  ServerException(String message) : super(message, statusCode: 500);
}
