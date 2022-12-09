import 'package:flutter/material.dart';
// import 'package:hms_16/Views/navbar/patient/patient_detail/patient_detail.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/widget/dialog_validation.dart';
import 'package:hms_16/widget/field_form_medical.dart';

class AddMedRecord extends StatefulWidget {
  const AddMedRecord({super.key});

  @override
  State<AddMedRecord> createState() => _AddMedRecordState();
}

class _AddMedRecordState extends State<AddMedRecord> {
  final formKey = GlobalKey<FormState>();
  final heightCtrl = TextEditingController();
  final weightCtrl = TextEditingController();
  final bloodPressureCtrl = TextEditingController();
  final temperatureCtrl = TextEditingController();
  final restHeartRateCtrl = TextEditingController();
  final breathRateCtrl = TextEditingController();
  final noteCtrl = TextEditingController();

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
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          children: [
            FieldMedical(
              controller: heightCtrl,
              title: 'Height',
              text: 'Height',
              suffix: 'Kg',
            ),
            const SizedBox(height: 10),
            FieldMedical(
              controller: weightCtrl,
              title: 'Weight',
              text: 'Weight',
              suffix: 'Kg',
            ),
            const SizedBox(height: 10),
            FieldMedical(
              controller: bloodPressureCtrl,
              title: 'Blood Pressure',
              text: 'Blood Pressure',
              suffix: 'mmHg',
            ),
            const SizedBox(height: 10),
            FieldMedical(
              controller: temperatureCtrl,
              title: 'Body Temperature',
              text: 'Body Temperature',
              suffix: 'C',
            ),
            const SizedBox(height: 10),
            FieldMedical(
              controller: restHeartRateCtrl,
              title: 'Resting Heart Rate',
              text: 'Resting Heart Rate',
              suffix: 'bpm',
            ),
            const SizedBox(height: 10),
            FieldMedical(
              controller: breathRateCtrl,
              title: 'Breath Rate',
              text: 'Breath Rate',
              suffix: 'rpm',
            ),
            const SizedBox(height: 10),
            FieldMedical(
              controller: noteCtrl,
              title: 'Note',
              text: 'Add Note',
              line: 3,
              required: false,
              // isSuffix: false,
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: (() {
                if (formKey.currentState!.validate()) {
                  dialogValidation(
                    context: context,
                    onPressedYes: () {
                      Navigator.pop(context);
                      dialogValidation(
                        context: context,
                        isValidation: false,
                        title: 'New Medical Successfully Saved!',
                        newPage: () {
                          Future.delayed(Duration(seconds: 2), (() {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }));
                          // Navigator.pop(context);
                        },
                      );
                      // durationDialog(context, 'New Medical Successfully Saved!');
                    },
                    title: 'are you sure to save a medical?',
                  );
                }
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
      ),
    );
  }
}
