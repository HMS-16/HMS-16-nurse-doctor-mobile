import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hms_16/model/error_model.dart';
import 'package:hms_16/model/login_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel with ChangeNotifier {
  Data? dataUser;
  String? eror;

  // Data _stateType = Data.loading;
  // Data get stateType => _stateType;

  void changeState(Data s) {
    // _stateType = s;
    notifyListeners();
  }

  Future<void> signIn({required String email, required String pass}) async {
    // changeState(DataState.loading);

    try {
      // changeState(DataState.loading);

      var responseData = await Auth().login(email: email, password: pass);
      if (responseData.statusCode == 200) {
        LoginModel modelUser = LoginModel.fromJson(responseData.data);
        final prefs = await SharedPreferences.getInstance();

        dataUser = modelUser.data;
        //token = modelUser.jwt;

        var encodeUser = jsonEncode(dataUser);
        //var encodeToken = jsonEncode(token);

        //await prefs.setString('token', encodeToken);
        await prefs.setString('user', encodeUser);
        await prefs.setBool('isLogin', true);

        notifyListeners();
        changeState(Data.succes);
      }
    } on DioError catch (e) {
      changeState(Data.error);
      if (e.response!.statusCode != 503) {
        ErrorModel error = ErrorModel.fromJson(e.response!.data);
        eror = error.error;
      } else {
        eror = e.response!.statusCode!.toString() + ' Service Unavailable';
        print(eror);
        print(e.message.toString());
      }
      //print(e.response!.data.toString());
      // debugPrint(error.error.toString());
      notifyListeners();
    }
  }
}
