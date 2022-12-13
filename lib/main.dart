import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hms_16/model/login_model.dart';
import 'package:hms_16/module/login/login_repository.dart';
import 'package:hms_16/module/register/register_repository.dart';
import 'package:hms_16/view_model/patient_view_model.dart';
import 'package:hms_16/view_model/doctor_view_model.dart';
import 'package:hms_16/screens/splash.dart';
import 'package:provider/provider.dart';

import 'view_model/condition_view_model.dart';
import 'view_model/treatment_view_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PatientViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => DoctorViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ConditionViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => TreatmentViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.nunitoTextTheme(
            const TextTheme(
              subtitle1: TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
