import 'package:dio/dio.dart';
import 'package:hms_16/screens/auth/login_page.dart';
import 'package:hms_16/services/patient_services.dart';
import 'package:hms_16/services/shared_services.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/view_model/auth_view_model.dart';
import 'package:hms_16/widget/dialog_validation.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:hms_16/model/patient_model.dart';

class PatientViewModel extends ChangeNotifier {
  List<DataPatient> _filterPatient = [];
  List<DataPatient> _patients = [];
  DataPatient? _patient;

  List<DataPatient> get filterPatients => _filterPatient;
  List<DataPatient> get persons => _patients;
  DataPatient? get person => _patient;

  final prefs = SharedService();
  ActionState patientState = ActionState.none;

  void changeState(ActionState state) {
    patientState = state;
    notifyListeners();
  }

  Future<void> getAllPatient(BuildContext context) async {
    try {
      if (_patients.isEmpty) {
        changeState(ActionState.loading);
      }

      var response = await PatientServices().getAll();

      PatientModel modelPatient = PatientModel.fromJson(response.data);
      if (_patients.length != modelPatient.data.length) {
        changeState(ActionState.loading);
      }

      await Future.delayed(Duration(seconds: 1));

      _patients = _filterPatient = (modelPatient.data)
          .map(
            (e) => DataPatient(
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
              status: e['status'] ? 1 : 0,
            ),
          )
          .toList();

      changeState(ActionState.none);

      if (patientState == ActionState.none) {
        print("sudah get all? none ya");
      }
      notifyListeners();
    } on DioError catch (e) {
      print(e.message);
      print("error di viewmodel get all");
      dialogValidation(
        context: context,
        isValidation: false,
        isImage: false,
        title: "masa anda telah habis, silahkan login kembali",
        newPage: () {
          Future.delayed(Duration(seconds: 2), () {
            changeState(ActionState.none);

            navReplaceTransition(context, LoginPage());
          });
        },
      );
      await prefs.deleteToken();
      await prefs.deleteIdUser();

      notifyListeners();
    }
  }

  selectedPerson(newPatient) {
    _patient = newPatient;
    notifyListeners();
  }

  changeProgressPatient(context) async {
    try {
      var response = await PatientServices().endCase(id: _patient!.id);

      getAllPatient(context);

      notifyListeners();
    } catch (e) {
      e.toString();
    }
  }

  searchPatient(String search) {
    final patientData = _patients;
    _filterPatient = patientData.where((patient) {
      return patient.name.toLowerCase().contains(search.toLowerCase());
    }).toList();

    notifyListeners();
  }
}
