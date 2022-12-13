import 'dart:convert';

LoginModel loginFromJson(String str) => LoginModel.fromJson(json.decode(str));

String logintoJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.data,
    required this.message,
    required this.token,
  });

  Data data;
  String message;
  String token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "token": token,
      };
}

class Data {
  Data({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.username,
    required this.email,
    required this.role,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String username;
  String email;
  int role;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        username: json["username"],
        email: json["email"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "username": username,
        "email": email,
        "role": role,
      };
}
