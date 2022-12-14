import 'package:flutter/material.dart';
import 'package:hms_16/model/patient_model.dart';

<<<<<<< HEAD
enum ActionState {
  none,
  loading,
  error,
}

class PatientViewModel extends ChangeNotifier {
  ActionState _state = ActionState.none;
  List<PatientModel> _patients = patients;
  PatientModel? _patient;

  ActionState get state => _state;

=======
class PatientViewModel extends ChangeNotifier {
  List<PatientModel> _patients = patients;
  PatientModel? _patient;

>>>>>>> origin/insertCondition
  List<PatientModel> get persons => _patients;
  PatientModel? get person => _patient;

  void selectedPerson(PatientModel newPatient) {
    _patient = newPatient;
    notifyListeners();
  }

<<<<<<< HEAD
  void _changeState(ActionState state) {
    _state = state;
    notifyListeners();
  }

  void changeProgressPatient(status) {
    _patient!.progress = status;
    notifyListeners();
  }

  void searchPatient(String search) {
    final patientData = patients;
    final searchPatient = patientData.where((patient) {
      return patient.name.toLowerCase().contains(search.toLowerCase());
    });

    _patients = searchPatient.toList();
    notifyListeners();
  }
=======
  void searchPatient(String title, String search) async {
    final patientData = patients;
    final searchPatient = patientData.where(
      // (patient) => patient.name.toLowerCase().contains(search.toLowerCase()),
      (patient) => patient.name.toLowerCase().contains(search.toLowerCase()),
    );
    _patients = searchPatient.toList();
    notifyListeners();
  }

  changeDoctor(index,doctor) {
    _patients[index].doctor = doctor;
    notifyListeners();
  }
>>>>>>> origin/insertCondition
}
