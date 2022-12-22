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
    required this.name,
    required this.password,
    required this.email,
    required this.strNum,
    required this.role,
  });

  String name;
  String password;
  String email;
  String strNum;

  int role;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        password: json["password"],
        email: json["email"],
        strNum: json["str_num"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
        "email": email,
        "str_num": strNum,
        "role": role,
      };
}
