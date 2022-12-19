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

  // var response;
  // List<PatientModel> _patients = patients;
  // List<PatientModel> get persons => _patients;

  void changeState(ActionState state) {
    patientState = state;
    notifyListeners();
  }

  Future<void> getAllPatient(BuildContext context) async {
    // print("paling atas func");
    // if (context.read<AuthViewModel>().state == ActionState.loading) {
    //   print("get all pasien? loading ya");
    // }
    try {
      if (_patients.isEmpty) {
        // print("if pertama $_patients");
        changeState(ActionState.loading);
        // patientState = ActionState.loading;
        // context.read<AuthViewModel>().changeState(ActionState.loading);
      }
      // var token = await prefs.getToken();
      var response = await PatientServices().getAll();
      // print(response.data.toString());
      PatientModel modelPatient = PatientModel.fromJson(response.data);
      if (_patients.length != modelPatient.data.length) {
        // print("if kedua $_patients");
        changeState(ActionState.loading);
        // patientState = ActionState.loading;
        // context.read<AuthViewModel>().changeState(ActionState.loading);
      }
      // final encoder = JsonEncoder.withIndent('  ').convert(modelPatient.data);
      // await Future.delayed(Duration(seconds: 2));
      await Future.delayed(Duration(seconds: 1));
      // print(_patients);
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
      // print(_patients);
      // print("berhasil try");
      // print(_patients);
        changeState(ActionState.none);
      // patientState = ActionState.none;
      // context.read<AuthViewModel>().changeState(ActionState.none);
      if (patientState == ActionState.none) {
        print("sudah get all? none ya");
      }
      notifyListeners();
    } on DioError catch (e) {
      // if () {

      // }
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
            // patientState = ActionState.none;
            // context.read<AuthViewModel>().changeState(ActionState.none);
            navReplaceTransition(context, LoginPage());
          });
        },
      );
      await prefs.deleteToken();
      await prefs.deleteIdUser();
      // await Future.delayed(Duration(seconds: 2));
      // print(e.toString());
      notifyListeners();
    }
  }

  selectedPerson(newPatient) {
    _patient = newPatient;
    notifyListeners();
  }

  changeProgressPatient(context) async {
    try {
      // var token = await prefs.getToken();
      var response = await PatientServices().endCase(id: _patient!.id);
      // print(response);
      getAllPatient(context);
      // _patient!.status = !status;
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

  // void changeDoctor(doctor) {
  //   _patient!.doctor = doctor;
  //   notifyListeners();
  // }

  // void changeSchedule(schedule) {
  //   _patient!.time = schedule;
  //   notifyListeners();
  // }
}
