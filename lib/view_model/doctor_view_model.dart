import 'package:flutter/material.dart';
import 'package:hms_16/model/change_doctor_model.dart';
import 'package:hms_16/model/doctor_model.dart';
import 'package:hms_16/services/doctor_services.dart';
import 'package:hms_16/view_model/schedule_view_model.dart';

class DoctorViewModel extends ChangeNotifier {
  List<DataDoctor> _listDoctors = [];
  DataDoctor? _doctorModel;

  List<DataDoctor> get getlistDoctor => _listDoctors;
  DataDoctor? get getdoctorModel => _doctorModel;

  getAllDoctor() async {
    try {
      var response = await DoctorServices().getAll();
      DoctorModels modelDoctor = DoctorModels.fromJson(response.data);
      _listDoctors = (modelDoctor.data)
          .map((e) => DataDoctor(
              strNum: e['str_num'],
              createdAt: e['created_at'],
              updatedAt: e['updated_at'],
              name: e['name'],
              email: e['email'],
              role: e['role']))
          .toList();
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  void selectedDoctor(DataDoctor doctorModel) {
    _doctorModel = doctorModel;
    notifyListeners();
  }
}
