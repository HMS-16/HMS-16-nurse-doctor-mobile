import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hms_16/api/auth.dart';
import 'package:hms_16/model/error_model.dart';
import 'package:hms_16/model/login_model.dart';
import 'package:dio/dio.dart';
import 'package:hms_16/screens/auth/sign_up_page.dart';
import 'package:hms_16/screens/navbar/navbar.dart';
import 'package:hms_16/services/shared_services.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:hms_16/widget/navreplace_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel with ChangeNotifier {
  Data? dataUser;
  String? eror;
  String? tokenBearer;
  String? idUser;

  // Data _stateType = Data.loading;
  //Data get stateType => _stateType;

  void changeState(Data s) {
    // _stateType = s;
    notifyListeners();
  }

  Future<void> signIn(
      {required String email,
      required String pass,
      required BuildContext context}) async {
    //changeState(DataState.loading);

    try {
      // changeState(DataState.loading);

      var responseData = await Auth().login(email: email, password: pass);
      if (responseData.statusCode == 200) {
        LoginModel modelUser = LoginModel.fromJson(responseData.data);
        // final prefs = await SharedPreferences.getInstance();
        SharedService prefs = SharedService();
        // print(modelUser);
        dataUser = modelUser.data;
        // print(dataUser);
        final token = modelUser.token;
        final role = dataUser!.role;
        tokenBearer = token;
        print(token);
        await prefs.saveToken(token);
        await prefs.saveRole(role);

        var encodeUser = jsonEncode(dataUser);
        print(encodeUser);
        //var token = jsonEncode(token);

        // await prefs.setString('token', token);
        // await prefs.setString('idUser', dataUser!.id);
        // await prefs.setBool('isLogin', true);
        // print(responseData.statusCode);
        // print(responseData.statusMessage);
        // print(responseData.data);

        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text("Success")));
        if (dataUser!.role == 3) {
          navReplaceTransition(context, const SignUpPage());
        } else {
          idUser = dataUser!.id;
          navReplaceTransition(context, const NavBar());
        }

        notifyListeners();
        // changeState(Data.succes);
      }
    } on DioError catch (e) {
      //changeState(Data.error);
      // print(e.response!.statusCode);
      // print(e.response!.statusMessage);
      // print(e.response!.redirects);
      if (e.response!.statusCode != 503) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("email or password is invalid")));
        // ErrorModel error = ErrorModel.fromJson(e.response!.data);
        // eror = error.error;
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
