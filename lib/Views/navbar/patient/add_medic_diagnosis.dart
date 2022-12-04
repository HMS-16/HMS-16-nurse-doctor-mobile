import 'package:flutter/material.dart';
// import 'package:hms_16/Views/navbar/patient/patient_detail/patient_detail.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/widget/dialog_validation.dart';
import 'package:hms_16/widget/field_form_medical.dart';

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
        iconTheme: IconThemeData(color: cBlack),
        backgroundColor: Colors.white,
        title: Text(
          'Medical Diagnosis',
          style: textStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
        ),
        leading: GestureDetector(
          child: const Icon(Icons.close),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          FieldMedical(
            title: 'Date',
            text: 'MM/DD/YYYY',
            // isSuffix: false,
          ),
          // SizedBox(height: 10),
          const SizedBox(height: 10),
          FieldMedical(
            title: 'Diagnosis',
            text: 'Add Diagnosis',
            line: 3,
            // isSuffix: false,
          ),
          const SizedBox(height: 10),
          FieldMedical(
            title: 'Prescription',
            text: 'Add Prescription',
            line: 3,
            // isSuffix: false,
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: (() {
              dialogValidation(
                context: context,
                onPressedYes: (() {
                  Navigator.pop(context);
                  dialogValidation(
                    context: context,
                    isValidation: false,
                    title: 'New Diagnose Successfully Saved!',
                    newPage: (() {
                      Future.delayed(Duration(seconds: 2),(() {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }));
                      // Navigator.pop(context);
                    }),
                  );
                  // durationDialog(context, 'New Diagnose Successfully Saved!');
                }),
                title: 'Are you sure to save the Diagnose?',
              );
            }),
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
