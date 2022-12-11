import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/view_model/condition_view_model.dart';
import 'package:hms_16/views/navbar/patient/add_medic_record.dart';
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
        Consumer<ConditionViewModel>(
          builder: (context, value, child) {
            return ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: value.conditions.length,
              itemBuilder: (context, index) {
                final condition = value.conditions[index];
                return TileMedRecord(
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
              },
            );
          },
        ),
      ],
    );
  }
}
