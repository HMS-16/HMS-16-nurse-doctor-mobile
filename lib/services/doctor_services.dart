import 'package:dio/dio.dart';
import 'package:hms_16/model/change_doctor_model.dart';
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

  Future<void> changeDoctor(ChangeDoctorModel doctorId, int id) async {
    String? token = await prefs.getToken();

    try {
      await Dio().put(
        '$baseUrl/appointment/change/doctor/$id',
        data: doctorId.toJson(),
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
