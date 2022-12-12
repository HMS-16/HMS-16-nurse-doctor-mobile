import 'dart:convert';
import 'package:hms_16/model/login_model.dart';
import 'package:http/http.dart' as http;

// class LoginRepository {
//   Future<http.Response> login(String email, String password) {
//     return http.post(Uri.parse("https://hms-api.fly.dev/v1/login"),
//         headers: <String, String>{
//           'Content-Type': "application/json; charset=UTF-8"
//         },
//         body:
//             jsonEncode(<String, String>{'email': email, 'password': password}));
//   }
// }

abstract class LoginPageRepository {
  Future<Login> fetchLogin(String email, String password);
}

class ApiService extends LoginPageRepository {
  static const String _baseUrl = 'https://hms-api.fly.dev/v1/admins/login';

  @override
  Future<Login> fetchLogin(String email, String password) async {
    final response = await http.post(Uri.parse(_baseUrl),
        body: {"email": email, "password": password});
    if (response.statusCode == 200) {
      print("login berhasil");
      return Login.fromJson(json.decode(response.body));
    } else {
      print("login gagal");
      throw Exception('Failed to load top headlines');
    }
  }
}
