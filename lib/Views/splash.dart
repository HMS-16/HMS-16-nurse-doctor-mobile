import 'package:flutter/material.dart';
import 'package:hms_16/Views/navbar.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/logo.png")),
          ),
        ),
      ),
      nextScreen: NavBar(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.white,
      splashIconSize: 450,
      duration: 4000,
      animationDuration: const Duration(seconds: 3),
    );
  }
}
