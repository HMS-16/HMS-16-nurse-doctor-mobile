import 'package:flutter/material.dart';
import 'package:hms_16/model/treatment_model.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/view_model/auth_view_model.dart';
import 'package:hms_16/view_model/patient_view_model.dart';
import 'package:hms_16/view_model/treatment_view_model.dart';
import 'package:hms_16/widget/dialog_validation.dart';
import 'package:hms_16/widget/field_form_medical.dart';
import 'package:provider/provider.dart';

class AddMedDiagnosis extends StatefulWidget {
  const AddMedDiagnosis({super.key});

  @override
  State<AddMedDiagnosis> createState() => _AddMedDiagnosisState();
}

class _AddMedDiagnosisState extends State<AddMedDiagnosis> {
  final formKey = GlobalKey<FormState>();
  final diagnoseCtrl = TextEditingController();
  final prescriptionCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = context.read<AuthViewModel>();
    final patientProvider = context.read<PatientViewModel>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        iconTheme: IconThemeData(color: cBlack),
        backgroundColor: Colors.white,
        title: Text(
          'Medical Diagnose',
          style: textStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
        ),
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
            const SizedBox(height: 10),
            FieldMedical(
              controller: diagnoseCtrl,
              title: 'Diagnosis',
              text: 'Add Diagnosis',
              line: 3,
              isNumeric: false,
            ),
            const SizedBox(height: 10),
            FieldMedical(
              controller: prescriptionCtrl,
              title: 'Prescription',
              text: 'Add Prescription',
              line: 3,
              isNumeric: false,
              // isSuffix: false,
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: (() {
                if (formKey.currentState!.validate()) {
                  dialogValidation(
                    context: context,
                    onPressedYes: (() {
                      context.read<TreatmentViewModel>().insertTreatment(
                            TreatmentModel(
                              idPatient: patientProvider.person!.id,
                              doctor: authProvider.profile!.username,
                              date: DateTime.now(),
                              diagnose: diagnoseCtrl.text,
                              prescription: prescriptionCtrl.text,
                            ),
                          );
                      Navigator.pop(context);
                      dialogValidation(
                        context: context,
                        isValidation: false,
                        title: 'New Diagnose Successfully Saved!',
                        newPage: (() {
                          Future.delayed(Duration(seconds: 2), (() {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }));
                        }),
                      );
                    }),
                    title: 'Are you sure to save the Diagnose?',
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
