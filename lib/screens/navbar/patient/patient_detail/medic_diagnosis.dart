import 'package:flutter/material.dart';
import 'package:hms_16/screens/navbar/patient/add_medic_diagnosis.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/view_model/patient_view_model.dart';
import 'package:hms_16/view_model/treatment_view_model.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:hms_16/widget/tile_med_diagnosis.dart';
import 'package:provider/provider.dart';

class MedicalDiagnosis extends StatefulWidget {
  const MedicalDiagnosis({super.key});

  @override
  State<MedicalDiagnosis> createState() => _MedicalDiagnosisState();
}

class _MedicalDiagnosisState extends State<MedicalDiagnosis> {
  @override
  Widget build(BuildContext context) {
    final patientViewModel = context.read<PatientViewModel>();
    return ListView(
      padding: EdgeInsets.only(
        top: patientViewModel.person!.progress ? 12 : 0,
        left: 16,
        right: 16,
        bottom: 12,
      ),
      children: [
        if (patientViewModel.person!.progress) ...[
          ElevatedButton.icon(
            onPressed: (() {
              navPushTransition(context, const AddMedDiagnosis());
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
              style:
                  textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
        SizedBox(height: 12),
        Consumer<TreatmentViewModel>(
          builder: (context, value, child) {
            return ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemCount: value.treatments.length,
              itemBuilder: (context, index) {
                final treatment = value.treatments[index];
                if (treatment.patient ==
                    context.read<PatientViewModel>().person!.name) {
                  return TileMedDiagnosis(
                    doctor: treatment.doctor,
                    date: treatment.date,
                    time: treatment.time == 0
                        ? "1.00 pm - 1.30 pm"
                        : treatment.time == 1
                            ? "1.30 pm - 2.00 pm"
                            : treatment.time == 2
                                ? "2.00 pm - 2.30 pm"
                                : "2.30 pm - 3.00 pm",
                    diagnose: treatment.diagnose,
                    prescription: treatment.prescription,
                  );
                } else {
                  return SizedBox();
                }
              },
            );
          },
        ),
      ],
    );
  }
}
