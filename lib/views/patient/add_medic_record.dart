import 'package:flutter/material.dart';
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
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Medical Record',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        leading: GestureDetector(
          child: Icon(Icons.close),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          FieldMedical(
            title: 'Height',
            text: 'Height',
            suffix: 'Kg',
          ),
          SizedBox(height: 10),
          FieldMedical(
            title: 'Weight',
            text: 'Weight',
            suffix: 'Kg',
          ),
          SizedBox(height: 10),
          FieldMedical(
            title: 'Blood Pressure',
            text: 'Blood Pressure',
            suffix: 'mmHg',
          ),
          SizedBox(height: 10),
          FieldMedical(
            title: 'Body Temperature',
            text: 'Body Temperature',
            suffix: 'C',
          ),
          SizedBox(height: 10),
          FieldMedical(
            title: 'Resting Heart Rate',
            text: 'Resting Heart Rate',
            suffix: 'bpm',
          ),
          SizedBox(height: 10),
          FieldMedical(
            title: 'Breath Rate',
            text: 'Breath Rate',
            suffix: 'rpm',
          ),
          SizedBox(height: 10),
          FieldMedical(
            title: 'Note',
            text: 'Add Note',
            line: 3,
            isRequired: false,
            isSuffix: false,
          ),
          SizedBox(height: 15),
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
