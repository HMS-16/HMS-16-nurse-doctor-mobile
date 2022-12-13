import 'package:dio/dio.dart';
import 'package:hms_16/model/login_model.dart';

class Auth {
  final _dio = Dio();
  String baseUrl = 'https://hms-api.fly.dev/v1';

  Future<Response> login(
      {required String email, required String password}) async {
    Response response;
    var data = {'email': email, 'password': password};
    response = await _dio.post(baseUrl + '/login', data: data);
    return response;
  }
}
