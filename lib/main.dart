import 'package:hms_16/Views/landing_page.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:hms_16/screens/patient/patient_screen/patient_screen.dart';
=======
import 'package:hms_16/views/patient/patient_detail.dart';
>>>>>>> origin/insertCondition

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
