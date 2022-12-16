import 'package:dio/dio.dart';

class PatientApi {
  final _dio = Dio();
  String baseUrl = 'https://hms-api.fly.dev/v1';

  Future getAll({required String token}) async {
    try {
      Response response;
      response = await _dio.get(
        baseUrl + '/patients',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      return response;
    } catch (e) {
      e.toString();
    }

    // final encoder = JsonEncoder.withIndent('  ').convert(response.data);
    // final data = DataPatient.fromJson(response.data['data']);
    // print(data);
    // print(encoder);
    // print(response);
  }

  Future endCase({required String token, required String id}) async {
    try {
      Response response;
      response = await _dio.put(
        baseUrl + '/patients/endcase/$id',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      return response;
    } catch (e) {
      e.toString();
    }
  }
}
