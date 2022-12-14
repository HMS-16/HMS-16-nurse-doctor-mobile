import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hms_16/api/auth.dart';
import 'package:hms_16/model/register_model.dart';

class RegisterViewModel with ChangeNotifier {
  String message = '';

  Future<void> register(Datum data, String token, BuildContext context) async {
    try {
      var response = await Auth().register(data: data,token: token);
      message = response.data['message'].toString();
      print(message);
      ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("create account success")));
    } on DioError catch (e) {
      message = e.response!.data;
      print(message);
      print('error di viewmodel');
    }
  }
}
