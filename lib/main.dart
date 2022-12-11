import 'package:flutter/material.dart';
import 'package:hms_16/Views/navbar/patient/patient_detail/patient_detail.dart';
import 'package:hms_16/view_model/condition_view_model.dart';
import 'package:hms_16/view_model/treatment_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConditionViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => TreatmentViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PatientDetail(),
      ),
    );
  }
}
