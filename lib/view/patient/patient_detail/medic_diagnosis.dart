import 'package:flutter/material.dart';
import 'package:hms_16/view/patient/patient_detail/add_medic_diagnosis.dart';
import 'package:hms_16/view/patient/patient_detail/widget/tile_med_diagnosis.dart';

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: ((context) => AddMedDiagnosis())),
            );
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
            style: TextStyle(fontSize: 13),
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
