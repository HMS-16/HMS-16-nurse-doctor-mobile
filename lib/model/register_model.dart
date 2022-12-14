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
    required this.password,
    required this.email,
    required this.strNum,
    // required this.phoneNum,
    required this.role,
  });

  String username;
  String password;
  String email;
  String strNum;
  // String phoneNum;
  int role;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        username: json["username"],
        password: json["password"],
        email: json["email"],
        strNum: json["str_num"],
        // phoneNum: json["phone_num"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
        "str_num": strNum,
        // "phone_num": phoneNum,
        "role": role,
      };
}
