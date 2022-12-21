import 'package:flutter/material.dart';
import 'package:hms_16/screens/navbar/patient/add_medic_diagnosis.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/view_model/auth_view_model.dart';
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
    final generalProvider = Provider.of<AuthViewModel>(context, listen: false);
    final patientProvider =
        Provider.of<PatientViewModel>(context, listen: false);
    return ListView(
      padding: const EdgeInsets.only(
        top: 12,
        left: 16,
        right: 16,
        bottom: 12,
      ),
      children: [
        if (generalProvider.profile!.role == 1 &&
            patientProvider.person!.status != 1) ...[
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
        Consumer<TreatmentViewModel>(
          builder: (context, value, child) {
            return ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: value.treatments.isNotEmpty
                  ? ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: value.treatments.length,
                      itemBuilder: (context, index) {
                        final treatment = value.treatments[index];
                        if (treatment.idPatient == patientProvider.person!.id) {
                          return TileMedDiagnosis(
                            doctor: treatment.doctor,
                            date: treatment.date,
                            diagnose: treatment.diagnose,
                            prescription: treatment.prescription,
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/no_data.png',
                          ),
                          const Text(
                              "There is no Medical Record for this Patient"),
                        ],
                      ),
                    ),
            );
          },
        ),
      ],
    );
  }
}
