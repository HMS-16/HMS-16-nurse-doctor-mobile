import 'dart:convert';

class Login {
  Login({
    required this.data,
    required this.message,
    required this.token,
  });

  Data data;
  String message;
  String token;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
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
    required this.phoneNum,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String username;
  String phoneNum;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        username: json["username"],
        phoneNum: json["phone_num"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "username": username,
        "phone_num": phoneNum,
      };
}
