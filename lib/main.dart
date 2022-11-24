import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hms_16/Views/navbar.dart';
import 'package:hms_16/regis_login/Views/landing_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
          foregroundColor: Color.fromRGBO(17, 83, 181, 1)
        )),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade200,
        ),
        scaffoldBackgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
         textTheme: GoogleFonts.nunitoTextTheme(
      Theme.of(context).textTheme,
    ),
      ),
      home: LandingPage(),
    );
  }
}
