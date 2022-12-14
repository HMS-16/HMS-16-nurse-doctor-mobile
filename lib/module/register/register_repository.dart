import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hms_16/api/auth.dart';
import 'package:hms_16/model/register_model.dart';

class RegisterViewModel with ChangeNotifier {
  String message = '';

  Future<void> register(Datum data) async {
    try {
      var response = await Auth().register(data: data);
      message = response.data['message'].toString();
    } on DioError catch (e) {
      message = e.response!.data;
    }
  }
}
