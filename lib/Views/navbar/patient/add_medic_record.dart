import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/widget/field_form_medical.dart';

class AddMedRecord extends StatefulWidget {
  const AddMedRecord({super.key});

  @override
  State<AddMedRecord> createState() => _AddMedRecordState();
}

class _AddMedRecordState extends State<AddMedRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: cBlack),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Medical Record',
          style: textStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
        ),
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: GestureDetector(
          child: const Icon(Icons.close),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          FieldMedical(
            title: 'Height',
            text: 'Height',
            suffix: 'Kg',
          ),
          const SizedBox(height: 10),
          FieldMedical(
            title: 'Weight',
            text: 'Weight',
            suffix: 'Kg',
          ),
          const SizedBox(height: 10),
          FieldMedical(
            title: 'Blood Pressure',
            text: 'Blood Pressure',
            suffix: 'mmHg',
          ),
          const SizedBox(height: 10),
          FieldMedical(
            title: 'Body Temperature',
            text: 'Body Temperature',
            suffix: 'C',
          ),
          const SizedBox(height: 10),
          FieldMedical(
            title: 'Resting Heart Rate',
            text: 'Resting Heart Rate',
            suffix: 'bpm',
          ),
          const SizedBox(height: 10),
          FieldMedical(
            title: 'Breath Rate',
            text: 'Breath Rate',
            suffix: 'rpm',
          ),
          const SizedBox(height: 10),
          FieldMedical(
            title: 'Note',
            text: 'Add Note',
            line: 3,
            isRequired: false,
            isSuffix: false,
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: (() {}),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff1153B5),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
