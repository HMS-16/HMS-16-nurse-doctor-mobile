import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hms_16/model/doctor_model.dart';
import 'package:hms_16/services/doctor_services.dart';

class DoctorViewModel extends ChangeNotifier {
  List<DataDoctor> _listDoctors = [];
  DataDoctor? _doctorModel;

  List<DataDoctor> get getlistDoctor => _listDoctors;
  DataDoctor? get getdoctorModel => _doctorModel;

  getAllDoctor() async {
    try {
      var response = await DoctorServices().getAll();
      // print("error di view model ${response}");
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
      // print(modelDoctor.data);
    } on DioError catch (e) {
      print(e.response!.statusMessage);
      print(e.response!.statusCode);
    }
    notifyListeners();
  }

  void selectedDoctor(DataDoctor doctorModel) {
    _doctorModel = doctorModel;
    notifyListeners();
  }
}
