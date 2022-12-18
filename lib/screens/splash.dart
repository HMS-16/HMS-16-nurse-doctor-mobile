import 'package:flutter/material.dart';
import 'package:hms_16/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    await context.read<AuthViewModel>().startTime(context);
    });
    // startTime();
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
