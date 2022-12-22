import 'package:dio/dio.dart';
import 'package:hms_16/services/shared_services.dart';

class DoctorServices {
  final _dio = Dio();
  String baseUrl = 'https://hms-api.fly.dev/v1';
  final prefs = SharedService();

  Future getAll() async {
    String? token = await prefs.getToken();

    try {
      Response response = await _dio.get(
        '$baseUrl/accounts',
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
