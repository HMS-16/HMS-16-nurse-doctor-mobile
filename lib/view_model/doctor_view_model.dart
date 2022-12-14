import 'package:flutter/material.dart';
import 'package:hms_16/model/doctor_model.dart';

class DoctorViewModel extends ChangeNotifier {
  List<DoctorModel> _listDoctors = listDoctors;
  DoctorModel? _doctorModel;

  List<DoctorModel> get getlistDoctor => _listDoctors;
  DoctorModel? get getdoctorModel => _doctorModel;

  void selectedDoctor(DoctorModel doctorModel) {
    _doctorModel = doctorModel;
    notifyListeners();
  }
}
