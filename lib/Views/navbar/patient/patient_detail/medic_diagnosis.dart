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
      padding: const EdgeInsets.only(
        top: 12,
        left: 16,
        right: 16,
        bottom: 12,
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
            backgroundColor: const Color(0xff1153B5),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          icon: const Icon(Icons.add),
          label: Text(
            'Add Medical Diagnosis',
            style: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
        const TileMedDiagnosis(),
        const TileMedDiagnosis(),
        const TileMedDiagnosis(),
        const TileMedDiagnosis(),
        const TileMedDiagnosis(),
        const TileMedDiagnosis(),
        const TileMedDiagnosis(),
        const TileMedDiagnosis(),
        const TileMedDiagnosis(),
        const TileMedDiagnosis(),
      ],
    );
  }
}
