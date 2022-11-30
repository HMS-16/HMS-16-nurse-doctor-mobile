import 'package:hms_16/Views/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:hms_16/screens/patient/patient_screen/patient_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
