import 'package:flutter/material.dart';
import 'package:hms_16/screens/navbar/patient/add_medic_record.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/view_model/auth_view_model.dart';
import 'package:hms_16/view_model/condition_view_model.dart';
import 'package:hms_16/view_model/patient_view_model.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:hms_16/widget/tile_med_record.dart';
import 'package:provider/provider.dart';

class MedicalRecord extends StatefulWidget {
  const MedicalRecord({super.key});

  @override
  State<MedicalRecord> createState() => _MedicalRecordState();
}

class _MedicalRecordState extends State<MedicalRecord> {

  @override
  Widget build(BuildContext context) {
    final authProvider = context.read<AuthViewModel>();
    final patientProvider = context.read<PatientViewModel>();
    return ListView(
      padding: const EdgeInsets.only(
        top: 12,
        left: 16,
        right: 16,
        bottom: 12,
      ),
      children: [
        if (authProvider.profile!.role == 2 &&
            patientProvider.person!.status != 1) ...[
          ElevatedButton.icon(
            onPressed: (() {
              navPushTransition(context, const AddMedRecord());
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
              'Add Medical Record',
              style:
                  textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
        Consumer<ConditionViewModel>(
          builder: (context, value, child) {
            return ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: value.conditions.isNotEmpty
                  ? ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: value.conditions.length,
                      itemBuilder: (context, index) {
                        final condition = value.conditions[index];
                        if (condition.idPatient == patientProvider.person!.id) {
                          return TileMedRecord(
                            nurse: condition.nurse,
                            date: condition.date,
                            height: condition.height,
                            weight: condition.weight,
                            bloodPressure: condition.bloodPressure,
                            sugarAnalysis: condition.sugarAnalysis,
                            temperature: condition.temperature,
                            restHeartRate: condition.restHeartRate,
                            breathRate: condition.breathRate,
                            note: condition.note,
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
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
