import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hms_16/screens/auth/landing_page.dart';
import 'package:hms_16/screens/auth/login_page.dart';
import 'package:hms_16/screens/profile/profile.dart';
import 'package:hms_16/services/auth_services.dart';
import 'package:hms_16/services/shared_services.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/widget/dialog_validation.dart';
import 'package:hms_16/widget/duration_dialog.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:hms_16/model/login_model.dart';
import 'package:hms_16/screens/auth/sign_up_page.dart';
import 'package:hms_16/screens/navbar/navbar.dart';
import 'package:hms_16/model/register_model.dart';

class AuthViewModel with ChangeNotifier {
  String? passUser;
  String message = '';

  DataLogin? _profile;
  DataLogin? get profile => _profile;

  final prefs = SharedService();
  ActionState authState = ActionState.none;

  void changeState(ActionState state) {
    authState = state;
    notifyListeners();
  }

  Future<void> startTime(BuildContext context) async {
    String? token = await prefs.getToken();
    if (token != null) {
      await getProfile();
    }
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
        } else if (token != null && _profile!.role == 3) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUpPage(),
            ),
          );
        } else if (firstTime == true) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LandingPage(),
            ),
          );
        }
      },
    );
    notifyListeners();
  }

  Future<void> register(Datum data, BuildContext context) async {
    changeState(ActionState.loading);
    try {
      var response = await AuthServices().register(data: data);
      changeState(ActionState.none);

      if (response != null) {
        dialogValidation(
          context: context,
          isValidation: false,
          title: "New user account has been registered successfully",
          newPage: () {
            Future.delayed(Duration(seconds: 2), () async {
              await prefs.deleteToken();
              navReplaceTransition(context, LoginPage());
            });
          },
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Registration Number or Role is invalid!"),
            duration: Duration(seconds: 5),
            action: SnackBarAction(
              label: "dismiss",
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future<void> signIn({
    required String email,
    required String pass,
    required BuildContext context,
  }) async {
    changeState(ActionState.loading);

    try {
      var responseData = await AuthServices().login(
        email: email,
        password: pass,
      );

      if (responseData.statusCode == 200) {
        LoginModel modelUser = LoginModel.fromJson(responseData.data);

        final dataUser = modelUser.data;
        passUser = pass;
        print(passUser);
        final token = modelUser.token;
        var encodeUser = json.encode(dataUser);

        await prefs.saveUser(encodeUser);
        await prefs.saveToken(token!);

        if (dataUser.role == 3) {
          navReplaceTransition(context, const SignUpPage());
          changeState(ActionState.none);
        } else {
          navReplaceTransition(context, const NavBar());
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("email or password is invalid!"),
          duration: Duration(seconds: 5),
          action: SnackBarAction(
            label: "dismiss",
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );
      changeState(ActionState.none);
    }
    notifyListeners();
  }

  Future getProfile() async {
    changeState(ActionState.loading);
    String? user = await prefs.getUser();
    print(jsonDecode(user!));
    // Map. user.
    // print(DataLogin.fromJson(user!));
    _profile = DataLogin.fromJson(jsonDecode(user));
    // await Future.delayed(Duration(seconds: 2));
    changeState(ActionState.none);
    notifyListeners();
    // return user;
  }

  Future logout(BuildContext context) async {
    await SharedService().deleteToken();

    await SharedService().deleteUser();

    navReplaceTransition(context, LoginPage());
    await Future.delayed(Duration(seconds: 1));
    _profile = null;
    notifyListeners();
  }

  Future changePassword(String newPass, BuildContext context) async {
    try {
      final response =
          await AuthServices().changePass(profile!.strNum, newPass);
      if (response.statusCode == 200) {
        durationDialog(context, "Password Changed Successfully!");
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pop(context);
          Navigator.pop(context);
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
