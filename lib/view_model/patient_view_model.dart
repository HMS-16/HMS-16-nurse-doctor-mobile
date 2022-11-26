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

  void searchPatient(String title, String search) async {
    final patientData = patients;
    final searchPatient = patientData.where(
      // (patient) => patient.name.toLowerCase().contains(search.toLowerCase()),
      (patient) => patient.name.toLowerCase().contains(search.toLowerCase()),
    );
    _patients = searchPatient.toList();
    notifyListeners();
  }

  changeDoctor(doctor) {
    _patient!.doctor = doctor;
    notifyListeners();
  }

  changeSchedule(schedule) {
    _patient!.time = schedule;
    notifyListeners();
  }

  changeProgressPatient(status) {
    _patient!.progress = status;
    notifyListeners();
  }
}
