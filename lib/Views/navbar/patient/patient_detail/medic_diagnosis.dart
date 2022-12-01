import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/views/navbar/patient/add_medic_diagnosis.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:hms_16/widget/tile_med_diagnosis.dart';

class MedicalDiagnosis extends StatefulWidget {
  const MedicalDiagnosis({super.key});

  @override
  State<MedicalDiagnosis> createState() => _MedicalDiagnosisState();
}

class _MedicalDiagnosisState extends State<MedicalDiagnosis> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
        bottom: 70,
      ),
      children: [
        ElevatedButton.icon(
          onPressed: (() {
            navPushTransition(context, const AddMedDiagnosis());
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: ((context) => AddMedDiagnosis())),
            // );
          }),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff1153B5),
            foregroundColor: Colors.white,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          icon: Icon(Icons.add),
          label: Text(
            'Add Medical Diagnosis',
            style: textStyle.copyWith(fontSize: 13),
          ),
        ),
        TileMedDiagnosis(),
        TileMedDiagnosis(),
        TileMedDiagnosis(),
        TileMedDiagnosis(),
        TileMedDiagnosis(),
        TileMedDiagnosis(),
        TileMedDiagnosis(),
        TileMedDiagnosis(),
        TileMedDiagnosis(),
        TileMedDiagnosis(),
      ],
    );
  }
}
