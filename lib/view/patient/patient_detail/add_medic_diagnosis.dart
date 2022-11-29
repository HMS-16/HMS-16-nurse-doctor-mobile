import 'package:flutter/material.dart';
import 'widget/field_form_medRecord.dart';

class AddMedDiagnosis extends StatefulWidget {
  const AddMedDiagnosis({super.key});

  @override
  State<AddMedDiagnosis> createState() => _AddMedDiagnosisState();
}

class _AddMedDiagnosisState extends State<AddMedDiagnosis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Medical Diagnosis',
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
          FieldMedRecord(
            title: 'Date',
            text: 'MM/DD/YYYY',
            isSuffix: false,
          ),
          // SizedBox(height: 10),
          SizedBox(height: 10),
          FieldMedRecord(
            title: 'Diagnosis',
            text: 'Add Diagnosis',
            line: 3,
            isSuffix: false,
          ),
          SizedBox(height: 10),
          FieldMedRecord(
            title: 'Prescription',
            text: 'Add Prescription',
            line: 3,
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
