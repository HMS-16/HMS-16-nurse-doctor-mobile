import 'package:dio/dio.dart';
import 'package:hms_16/model/register_model.dart';
import 'package:hms_16/services/shared_services.dart';

class AuthServices {
  final _dio = Dio();
  String baseUrl = 'https://hms-api.fly.dev/v1';
  final prefs = SharedService();

  Future login({
    required String email,
    required String password,
  }) async {
    try {
      var data = {'email': email, 'password': password};
      Response response = await _dio.post('$baseUrl/login', data: data);
      return response;
    } on DioError catch (e) {
      print(e.response!.statusMessage);
      print(e.response!.statusCode);
      print("error message = ${e.message}");
    }
  }

  Future register({required Datum data}) async {
    String? token = await prefs.getToken();
    try {
      Response response = await _dio.post(
        '$baseUrl/register',
        data: data.toJson(),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      return response;
    } on DioError catch (e) {
      print(e.response!.statusMessage);
      print(e.response!.statusCode);
      print("error message = ${e.message}");
    }
  }
}
