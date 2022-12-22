import 'dart:convert';

class LoginModel {
  LoginModel({
    required this.data,
    required this.message,
    required this.token,
  });

  DataLogin data;
  String message;
  String? token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        data: DataLogin.fromJson(json["data"]),
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "token": token,
      };
}

class DataLogin {
  DataLogin({
    required this.strNum,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.email,
    required this.role,
  });

  String strNum;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String email;
  int role;

  factory DataLogin.fromJson(Map<String, dynamic> json) => DataLogin(
        strNum: json["str_num"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        email: json["email"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "str_num": strNum,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
        "email": email,
        "role": role,
      };
}
