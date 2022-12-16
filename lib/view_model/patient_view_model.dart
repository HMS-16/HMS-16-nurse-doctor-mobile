import 'dart:convert';
import 'dart:math';
import 'package:hms_16/services/shared_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  List<DataPatient> sudef = [];
  List<DataPatient> _patients = [];
  DataPatient? _patient;

  List<DataPatient> get sudefs => sudef;
  List<DataPatient> get persons => _patients;
  DataPatient? get person => _patient;

  // var response;
  // List<PatientModel> _patients = patients;
  // List<PatientModel> get persons => _patients;

  getAllPatient(token) async {
    try {
      var response = await PatientApi().getAll(token: token);
      PatientModel modelPatient = PatientModel.fromJson(response.data);
      final encoder = JsonEncoder.withIndent('  ').convert(modelPatient.data);
      _patients = sudef = (modelPatient.data)
          .map((e) => DataPatient(
                id: e['id'],
                name: e['name'],
                pob: e['pob'],
                dob: e['DOB'],
                gender: e['gender'],
                married: e['married'],
                bloodType: e['blood_type'],
                phone: e['phone_num'],
                email: e['email'],
                address: e['address'],
                city: e['city'],
                province: e['province'],
                familyName: e['family_name'],
                relationship: e['relationship'],
                familyContact: e['family_contact'],
                status: e['status'] ? 'a' : 'b',
              ))
          .toList();
      // print(_patients);
      notifyListeners();
    } catch (e) {
      e.toString();
    }
  }

  selectedPerson(newPatient) {
    _patient = newPatient;
    notifyListeners();
  }

  changeProgressPatient(token, id) async {
    try {
      var response = await PatientApi().endCase(token: token, id: id);
      // print(response);
      getAllPatient(token);
      // _patient!.status = !status;
      notifyListeners();
    } catch (e) {
      e.toString();
    }
  }

  searchPatient(String search) {
    // final patientData = _patients;
    sudef = _patients.where((patient) {
      return patient.name.toLowerCase().contains(search.toLowerCase());
    }).toList();

    notifyListeners();
  }

  // void changeDoctor(doctor) {
  //   _patient!.doctor = doctor;
  //   notifyListeners();
  // }

  // void changeSchedule(schedule) {
  //   _patient!.time = schedule;
  //   notifyListeners();
  // }
}
