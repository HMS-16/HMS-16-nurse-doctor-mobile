import 'package:dio/dio.dart';
import 'package:hms_16/model/login_model.dart';
import 'package:hms_16/model/register_model.dart';

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

  Future<Response> register({required Datum data}) async {
    Response response;
    response = await _dio.post(baseUrl + '/register', data: data.toJson());
    return response;
  }
}
