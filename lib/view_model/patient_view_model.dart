import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hms_16/api/patient_api.dart';
import 'package:hms_16/model/patient_model.dart';

// enum ActionState {
//   none,
//   loading,
//   error,
// }

class PatientViewModel extends ChangeNotifier {
  // List _patients = [];
  // List get persons => _patients;
  // var response;

  void getAllPatient(token) async {
    try {
      var response = await PatientApi().getAll(token: token);
      PatientModel modelPatient = PatientModel.fromJson(response.data);
      final encoder = JsonEncoder.withIndent('  ').convert(modelPatient.data);
      print(encoder);
      // print(modelPatient.data);
    } catch (e) {
      e.toString();
    }
    // final encoder = JsonEncoder.withIndent('  ').convert(response.data);
    // print(encoder);
  }
  // List<PatientModel> _patients = patients;
  // PatientModel? _patient;

  // List<PatientModel> get persons => _patients;
  // PatientModel? get person => _patient;

  // void selectedPerson(PatientModel newPatient) {
  //   _patient = newPatient;
  //   notifyListeners();
  // }

  // void changeProgressPatient(status) {
  //   _patient!.progress = status;
  //   notifyListeners();
  // }

  // void searchPatient(String search) {
  //   final patientData = patients;
  //   final searchPatient = patientData.where((patient) {
  //     return patient.name.toLowerCase().contains(search.toLowerCase());
  //   });

  //   _patients = searchPatient.toList();
  //   notifyListeners();
  // }

  // void changeDoctor(doctor) {
  //   _patient!.doctor = doctor;
  //   notifyListeners();
  // }

  // void changeSchedule(schedule) {
  //   _patient!.time = schedule;
  //   notifyListeners();
  // }
}
