import 'dart:convert';

RegisterModel registerFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.message,
  });
  String message;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}

class Datum {
  Datum({
    required this.username,
    required this.email,
    required this.phoneNum,
    required this.role,
  });

  String username;
  String email;
  String phoneNum;
  int role;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        username: json["username"],
        email: json["email"],
        phoneNum: json["phone_num"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "phone_num": phoneNum,
        "role": role,
      };
}
