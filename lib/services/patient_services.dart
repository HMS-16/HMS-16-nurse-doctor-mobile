import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hms_16/screens/auth/login_page.dart';
import 'package:hms_16/services/shared_services.dart';
import 'package:hms_16/widget/navpush_transition.dart';

class PatientServices {
  final _dio = Dio();
  String baseUrl = 'https://hms-api.fly.dev/v1';
  final prefs = SharedService();

  Future getAll() async {
    String? token = await prefs.getToken();
    try {
      Response response;
      response = await _dio.get(
        baseUrl + '/patients',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

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

  Future endCase({required String id}) async {
    String? token = await prefs.getToken();
    try {
      Response response;
      response = await _dio.put(
        baseUrl + '/patients/endcase/$id',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      return response;
    } on DioError catch (e) {
      print(e.response!.statusMessage);
      print(e.response!.statusCode);
    }
  }
}
