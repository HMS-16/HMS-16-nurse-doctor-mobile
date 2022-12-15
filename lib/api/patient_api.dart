import 'package:dio/dio.dart';

class PatientApi {
  final _dio = Dio();
  String baseUrl = 'https://hms-api.fly.dev/v1';

  Future getAll({required String token}) async {
    Response response;
    response = await _dio.get(
      baseUrl + '/patients',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    // final encoder = JsonEncoder.withIndent('  ').convert(response.data);
    // final data = DataPatient.fromJson(response.data['data']);
    // print(data);
    // print(encoder);
    return response;
  }
}
