import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:hms_16/screens/auth/login_page.dart';
import 'package:hms_16/widget/dialog_validation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hms_16/api/auth_api.dart';
import 'package:hms_16/model/login_model.dart';
import 'package:hms_16/screens/auth/sign_up_page.dart';
import 'package:hms_16/screens/navbar/navbar.dart';
import 'package:hms_16/widget/navreplace_transition.dart';
import 'package:hms_16/model/register_model.dart';
import 'package:hms_16/widget/duration_dialog.dart';
import 'package:hms_16/view_model/general_view_model.dart';

class AuthViewModel with ChangeNotifier {
  Data? dataUser;
  String? eror;
  String? tokenBearer;
  String? idUser;
  String message = '';

  // Data _stateType = Data.loading;
  //Data get stateType => _stateType;

  // void changeState(Data s) {
  //   // _stateType = s;
  //   notifyListeners();
  // }

  Future<void> signIn({
    required String email,
    required String pass,
    required BuildContext context,
  }) async {
    context.read<GeneralViewModel>().changeState(ActionState.loading);

    try {
      // changeState(DataState.loading);

      var responseData = await Auth().login(email: email, password: pass);
      if (responseData.statusCode == 200) {
        LoginModel modelUser = LoginModel.fromJson(responseData.data);
        final prefs = await SharedPreferences.getInstance();
        // print(modelUser);

        dataUser = modelUser.data;
        // print(dataUser);
        final token = modelUser.token;
        tokenBearer = token;
        print(token);

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

        context.read<GeneralViewModel>().changeState(ActionState.none);
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
      // context.read<GeneralViewModel>().changeState(ActionState.error);
      // Future.delayed(Duration(seconds: 2), () {
      //   context.read<GeneralViewModel>().changeState(ActionState.none);
      // });
      notifyListeners();
    }
  }

  Future<void> register(Datum data, String token, BuildContext context) async {
    context.read<GeneralViewModel>().changeState(ActionState.loading);
    try {
      var response = await Auth().register(data: data, token: token);
      message = response.data['message'].toString();
      print(data.toJson());
      print(message);
      context.read<GeneralViewModel>().changeState(ActionState.none);
      dialogValidation(
        context: context,
        isValidation: false,
        title: "New user account has been registered successfully",
        newPage: () {
          Future.delayed(Duration(seconds: 2), () {
            navReplaceTransition(context, LoginPage());
          });
        },
      );
      // durationDialog(
      //     context, "New user account has been registered successfully");
      // navReplaceTransition(context, LoginPage());
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text("New user account has been registered successfully")));
      notifyListeners();
    } on DioError catch (e) {
      message = e.response!.data;
      print(message);
      print('error di viewmodel');
      notifyListeners();
    }
  }
}
