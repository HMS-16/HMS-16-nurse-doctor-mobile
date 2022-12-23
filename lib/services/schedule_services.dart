import 'package:dio/dio.dart';
import 'package:hms_16/model/change_schedule_model.dart';
import 'package:hms_16/services/shared_services.dart';

class ScheduleServices {
  final _dio = Dio();
  String baseUrl = 'https://hms-api.fly.dev/v1';
  final prefs = SharedService();

  Future getAllSchedule() async {
    String? token = await prefs.getToken();
    try {
      Response response;
      response = await _dio.get(
        '$baseUrl/appointment',
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

  Future getDetail(String id) async {
    String? token = await prefs.getToken();
    try {
      Response response;
      response = await _dio.get(
        '$baseUrl/patient/$id',
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

  Future<void> changeSchedule(ChangeScheduleModel user, int id) async {
    String? token = await prefs.getToken();

    try {
      await Dio().put(
        '$baseUrl/appointment/change/date/$id',
        data: user.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
    } on DioError catch (e) {
      print(e.response!.statusCode);
      print(e.response!.statusMessage);
      print("error message = ${e.message}");
    }
  }
}
