class EndPoint {
  // الروابط الأساسية
  static const String baseUrl = 'http://192.168.0.190/supply-api/api';

  // auth
  static const String addUser = '/auth/register.php';
  static const String logIn = '/auth/login.php';

  //  دوال مساعدة
  static String buildUrl(String endpoint, [Map<String, dynamic>? params]) {
    String url = baseUrl + endpoint;
    if (params != null && params.isNotEmpty) {
      final queryString = Uri(queryParameters: params).query;
      return url += '?$queryString';
    }
    return url;
  }
}
