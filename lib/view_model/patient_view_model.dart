import 'package:flutter/material.dart';
import 'package:hms_16/model/patient_model.dart';

class PatientViewModel extends ChangeNotifier {
  Iterable<PatientModel> _patients = patients;
  PatientModel? _patient;

  Iterable<PatientModel> get persons => _patients;
  PatientModel? get person => _patient;

  void selectedPerson(PatientModel newPatient) {
    _patient = newPatient;
    notifyListeners();
  }

  void searchPatient(String title, String search) async {
    final patientData = patients;
    final searchPatient = patientData.where(
      (patient) => patient.name.toLowerCase().contains(search.toLowerCase()),
    );
    _patients = searchPatient;
    notifyListeners();
  }
}
