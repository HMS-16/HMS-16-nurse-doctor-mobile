import 'package:flutter/material.dart';
import 'package:hms_16/api/auth.dart';
import 'package:hms_16/model/login_model.dart';
import 'package:hms_16/screens/auth/landing_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:hms_16/screens/auth/sign_up_page.dart';
import 'package:hms_16/screens/navbar/navbar.dart';
import 'package:hms_16/services/shared_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> startTime() async {
    final prefs = SharedService();
    String? token = await prefs.getToken();
    int? role = await prefs.getRole();
    await Future.delayed(
      const Duration(seconds: 4),
      () {
        if (token != null && role == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const NavBar(),
            ),
          );
          print("TOKEN ==== $token");
          print("ROLE ==== $role");
        } else if (token != null && role == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const NavBar(),
            ),
          );
          print("TOKEN ==== $token");
          print("ROLE ==== $role");
        } else if (token != null && role == 3) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUpPage(),
            ),
          );
          print("TOKEN ==== $token");
          print("ROLE ==== $role");
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LandingPage(),
            ),
          );
          print("TOKEN ==== $token");
          print("ROLE ==== $role");
        }
      },
    );
  }

  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(seconds: 3),
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
  // @override
  // Widget build(BuildContext context) {
  //   return AnimatedSplashScreen(
  //     splash: Center(
  //       child: Container(
  //         decoration: const BoxDecoration(
  //           image: DecorationImage(image: AssetImage("assets/images/logo.png")),
  //         ),
  //       ),
  //     ),
  //     nextScreen: LandingPage(),
  //     splashTransition: SplashTransition.fadeTransition,
  //     backgroundColor: Colors.white,
  //     splashIconSize: 500,
  //     duration: 1000,
  //     animationDuration: const Duration(seconds: 2),
  //   );
  // }
// }
