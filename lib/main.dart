import 'package:flutter/material.dart';
import 'package:hms_16/model/doctor_view_model.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/views/splash.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => DoctorViewModel(),
      )
    ], child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
