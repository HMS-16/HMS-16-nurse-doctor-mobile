import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/views/navbar/patient/add_medic_record.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:hms_16/widget/tile_med_record.dart';

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
        top: 10,
        left: 10,
        right: 10,
        bottom: 70,
      ),
      children: [
        ElevatedButton.icon(
          onPressed: (() {
            navPushTransition(context, const AddMedRecord());
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: ((context) => AddMedRecord())),
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
            'Add Medical Record',
            style:
                textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
        const TileMedRecord(),
        const TileMedRecord(),
        const TileMedRecord(),
        const TileMedRecord(),
        const TileMedRecord(),
        const TileMedRecord(),
        const TileMedRecord(),
        const TileMedRecord(),
        const TileMedRecord(),
        const TileMedRecord(),
      ],
    );
  }
}
