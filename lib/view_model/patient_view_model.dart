import 'package:flutter/material.dart';
import 'package:hms_16/model/patient_model.dart';

class PatientViewModel extends ChangeNotifier {
  List<PatientModel> _patients = patients;
  PatientModel? _patient;

  List<PatientModel> get persons => _patients;
  PatientModel? get person => _patient;

  void selectedPerson(PatientModel newPatient) {
    _patient = newPatient;
    notifyListeners();
  }
}
