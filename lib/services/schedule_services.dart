import 'package:dio/dio.dart';
import 'package:hms_16/model/change_schedule_model.dart';
import 'package:hms_16/services/shared_services.dart';
import 'package:intl/intl.dart';

class ScheduleServices {
  final _dio = Dio();
  String baseUrl = 'https://hms-api.fly.dev/v1';
  final prefs = SharedService();

  Future getAllSchedule(String date) async {
    String? token = await prefs.getToken();
    try {
      Response response;
      response = await _dio.get(
        baseUrl + '/appointment/all?date=$date',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      // print(DateFormat('M/d/y').format(DateTime.now()));
      // print(response);
      return response;
    } on DioError catch (e) {
      print(e.response!.statusMessage);
      print(e.response!.statusCode);
      // throw e.toString();
    }

    // final encoder = JsonEncoder.withIndent('  ').convert(response.data);
    // final data = DataPatient.fromJson(response.data['data']);
    // print(data);
    // print(encoder);
    // print(response);
  }

  Future getDetail(String id) async {
    String? token = await prefs.getToken();
    try {
      Response response;
      response = await _dio.get(
        baseUrl + 'appointment/patient/$id',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      // print(DateFormat('M/d/y').format(DateTime.now()));
      // print(response);
      return response;
    } on DioError catch (e) {
      print(e.response!.statusMessage);
      print(e.response!.statusCode);
      // throw e.toString();
    }

    // final encoder = JsonEncoder.withIndent('  ').convert(response.data);
    // final data = DataPatient.fromJson(response.data['data']);
    // print(data);
    // print(encoder);
    // print(response);
  }

  Future<void> changeSchedule(ChangeScheduleModel user, int id) async {
    String? token = await prefs.getToken();
    // print(token);
    try {
      print("BERHASIL CHANGE");
      await Dio().put(
        '$baseUrl/appointment/change/date/$id',
        data: user.toJson(),
        options: Options(
          headers: {
            // 'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      // print('CEKM PUT = $response');
    } on DioError catch (e) {
      print(e.response!.statusCode);
      print(e.response!.statusMessage);
      print("error message = ${e.message}");
    }
  }

  // Future endCase({required String id}) async {
  //   String? token = await prefs.getToken();
  //   try {
  //     Response response;
  //     response = await _dio.put(
  //       baseUrl + '/patients/endcase/$id',
  //       options: Options(
  //         headers: {'Authorization': 'Bearer $token'},
  //       ),
  //     );
  //     return response;
  //   } on DioError catch (e) {
  //     print(e.response!.statusMessage);
  //     print(e.response!.statusCode);
  //   }
  // }
}
