import 'package:flutter/material.dart';
import 'widget/field_form_medRecord.dart';

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
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text('Medical Record'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          FieldMedRecord(
            title: 'Height',
            text: 'Height',
            suffix: 'Kg',
          ),
          SizedBox(height: 10),
          FieldMedRecord(
            title: 'Weight',
            text: 'Weight',
            suffix: 'Kg',
          ),
          SizedBox(height: 10),
          FieldMedRecord(
            title: 'Blood Pressure',
            text: 'Blood Pressure',
            suffix: 'mmHg',
          ),
          SizedBox(height: 10),
          FieldMedRecord(
            title: 'Body Temperature',
            text: 'Body Temperature',
            suffix: 'C',
          ),
          SizedBox(height: 10),
          FieldMedRecord(
            title: 'Resting Heart Rate',
            text: 'Resting Heart Rate',
            suffix: 'bpm',
          ),
          SizedBox(height: 10),
          FieldMedRecord(
            title: 'Breath Rate',
            text: 'Breath Rate',
            suffix: 'rpm',
          ),
          SizedBox(height: 10),
          FieldMedRecord(
            title: 'Note',
            text: 'Add Note',
            line: 4,
            isRequired: false,
            isSuffix: false,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: (() {}),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff1153B5),
              foregroundColor: Colors.white,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
