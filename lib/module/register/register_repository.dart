import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hms_16/api/auth.dart';
import 'package:hms_16/model/register_model.dart';
import 'package:hms_16/widget/duration_dialog.dart';

class RegisterViewModel with ChangeNotifier {
  String message = '';

  Future<void> register(Datum data, String token, BuildContext context) async {
    try {
      var response = await Auth().register(data: data, token: token);
      message = response.data['message'].toString();
      print(data.toJson());
      print(message);
      durationDialog(
          context, "New user account has been registered successfully");
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text("New user account has been registered successfully")));
    } on DioError catch (e) {
      message = e.response!.data;
      print(message);
      print('error di viewmodel');
    }
  }
}
