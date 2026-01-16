import '../../domain/entities/user_entity.dart';

class UserModel {
  final int id;
  final String userName;
  final String email;
  final String password;

  UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // إذا البيانات داخل "data" → "user"
    final userJson = json["data"]?["user"] ?? json;

    return UserModel(
      id: int.tryParse('${json["user_id"] ?? json["id"]}') ?? 0,
      userName: userJson["name"]?.toString() ?? '',
      email: userJson["email"]?.toString() ?? '',
      password: userJson["password"]?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user_id": id,
      "name": userName,
      "email": email,
      "password": password,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      userName: userName,
      email: email,
      password: password,
    );
  }
}
