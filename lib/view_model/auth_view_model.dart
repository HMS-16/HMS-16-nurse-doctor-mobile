import 'dart:convert';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hms_16/screens/auth/landing_page.dart';
import 'package:hms_16/screens/auth/login_page.dart';
import 'package:hms_16/services/auth_services.dart';
import 'package:hms_16/services/shared_services.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/widget/dialog_validation.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:provider/provider.dart';
import 'package:hms_16/model/login_model.dart';
import 'package:hms_16/screens/auth/sign_up_page.dart';
import 'package:hms_16/screens/navbar/navbar.dart';
import 'package:hms_16/model/register_model.dart';

// enum ActionState {
//   none,
//   loading,
//   // error,
// }

class AuthViewModel with ChangeNotifier {
  // Data? dataUser;
  // String? eror;
  // String? tokenBearer;
  String? idUser;
  String message = '';
  final prefs = SharedService();

  // Data _stateType = Data.loading;
  //Data get stateType => _stateType;

  // void changeState(Data s) {
  //   // _stateType = s;
  //   notifyListeners();
  // }

  ActionState authState = ActionState.none;
  Data? _profile;
  // int? _role;
  // ActionState get state => _state;
  Data? get profile => _profile;
  // int? get role => _role;

  // final prefs = SharedService();

  void changeState(ActionState state) {
    authState = state;
    notifyListeners();
  }

  // roleUser() async {
  //   final prefs = SharedService();
  //   _role = await prefs.getRole();
  //   // print(_role);
  //   notifyListeners();
  // }

  Future<void> startTime(BuildContext context) async {
    String? token = await prefs.getToken();
    // String? idUser = await prefs.getIduser();
    if (token != null) {
      await getProfileById();
    }
    // _role = await prefs.getRole();
    bool? firstTime = await prefs.getFirstTime();
    await Future.delayed(
      const Duration(seconds: 4),
      () {
        if (token != null && (_profile!.role == 1 || _profile!.role == 2)) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const NavBar(),
            ),
          );
          print("TOKEN ==== $token");
          // print("PROFILE ==== $_profile");
        } else if (token != null && _profile!.role == 3) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUpPage(),
            ),
          );
          print("TOKEN ==== $token");
          // print("PROFILE ==== $_profile");
        } else if (firstTime == true) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
          print("TOKEN ==== $token");
          // print("PROFILE ==== $_profile");
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LandingPage(),
            ),
          );
          print("TOKEN ==== $token");
          // print("PROFILE ==== $_profile");
        }
      },
    );
    notifyListeners();
  }

  Future<void> register(Datum data, BuildContext context) async {
    changeState(ActionState.loading);
    try {
      // authState = ActionState.loading;
      var token = await prefs.getToken();
      var response = await Auth().register(data: data, token: token!);
      message = response.data['message'].toString();
      print(data.toJson());
      print("dalam try $message");
      // authState = ActionState.none;
      changeState(ActionState.none);
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
      // changeState(ActionState.none);
      notifyListeners();
    } on DioError catch (e) {
      message = e.response!.data;
      print("dalam catch $message");
      print('error di viewmodel');
      notifyListeners();
    }
  }

  Future<void> signIn({
    required String email,
    required String pass,
    required BuildContext context,
  }) async {
      changeState(ActionState.loading);
      if (authState == ActionState.loading) {
        print('mau login? loading ya');
      }
    try {
      // authState = ActionState.loading;
      // changeState(DataState.loading);

      var responseData = await Auth().login(email: email, password: pass);
      if (responseData.statusCode == 200) {
        LoginModel modelUser = LoginModel.fromJson(responseData.data);
        final prefs = SharedService();
        // print(modelUser);

        Data dataUser = modelUser.data;
        idUser = modelUser.data.id;
        print(idUser);
        // print(dataUser);
        final token = modelUser.token;
        // tokenBearer = token;
        print(token);

        var encodeUser = jsonEncode(dataUser);
        print(encodeUser);
        //var token = jsonEncode(token);

        // await prefs.saveRole(dataUser!.role);
        await prefs.saveToken(token!);
        await prefs.saveIdUser(dataUser.id);
        // context.read<ProfileViewModel>().getProfileById();
        // await prefs.setString('token', token);
        // await prefs.setString('idUser', dataUser!.id);
        // await prefs.setBool('isLogin', true);
        // print(responseData.statusCode);
        // print(responseData.statusMessage);
        // print(responseData.data);

        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text("Success")));
        if (dataUser.role == 3) {
          navReplaceTransition(context, const SignUpPage());
          // authState = ActionState.none;
          changeState(ActionState.none);
        } else {
          // idUser = dataUser.id;
          navReplaceTransition(context, const NavBar());
        }

        if (authState == ActionState.none) {
          print('login admin? none ya');
        }

        // changeState(Data.succes);
      }
      notifyListeners();
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
        // eror = e.response!.statusCode!.toString() + ' Service Unavailable';
        // print(eror);
        print(e.message.toString());
      }
      //print(e.response!.data.toString());
      // debugPrint(error.error.toString());
      // context.read<ProfileViewModel>().changeState(ActionState.error);
      // Future.delayed(Duration(seconds: 2), () {
      //   context.read<ProfileViewModel>().changeState(ActionState.none);
      // });
      // changeState(ActionState.none);
      notifyListeners();
    }
  }

  Future getProfileById() async {
      changeState(ActionState.loading);
      if (authState == ActionState.loading) {
        print('get profile? ok laoding');
      }
    try {
      // authState = ActionState.loading;
      // var token = await prefs.getToken();
      String? idUser = await prefs.getIduser();
      String? token = await prefs.getToken();
      var responseData = await Auth().getById(id: idUser!, token: token!);
      LoginModel modelUser = LoginModel.fromJson(responseData.data);
      // print("${modelUser.data}");
      _profile = modelUser.data;
      final encodeuser = jsonEncode(_profile);
      print("ini di try getprofilebyid $encodeuser");
      // return modelUser.data;
      // await Future.delayed(Duration(seconds: 2));
      // print('setelah 4 detik');
      changeState(ActionState.none);
      authState = ActionState.none;
      if (authState == ActionState.none) {
        print('selesai get profile? none ya');
      }
      notifyListeners();
    } catch (e) {
      e.toString();
      // changeState(ActionState.none);
      notifyListeners();
    }
  }

  Future logout(BuildContext context) async {
    // changeState(ActionState.loading);
    if (authState == ActionState.loading) {
      print('mau logout? loading ya');
    }
    await SharedService().deleteToken();
    await SharedService().deleteIdUser();
    // await Future.delayed(Duration(seconds: 1));
    // Navigator.push
    // Navigator.pop(context);
    navReplaceTransition(context, LoginPage());
    // changeState(ActionState.none);
    if (authState == ActionState.none) {
      print('logout? none');
    }
    await Future.delayed(Duration(seconds: 1));
    _profile = null;
    notifyListeners();
  }
}
