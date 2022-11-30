import 'package:flutter/material.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:hms_16/screens/patient/patient_screen/patient_screen.dart';
=======
import 'package:hms_16/views/patient/patient_detail.dart';
>>>>>>> origin/insertCondition
=======
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hms_16/Views/splash.dart';
>>>>>>> origin/homepage

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const PatientScreen(),
=======
      theme: ThemeData(),
      home: LandingPage(),
>>>>>>> origin/regis_login
=======
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const PatientDetail(),
>>>>>>> origin/insertCondition
=======
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromRGBO(17, 83, 181, 1))),
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.transparent,
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        scaffoldBackgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const SplashScreen(),
>>>>>>> origin/homepage
    );
  }
}
