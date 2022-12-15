import 'package:flutter/material.dart';
import 'package:hms_16/model/schedule_model.dart';

class ScheduleViewModel extends ChangeNotifier {
  List<ScheduleModel> _listSchedules = listSchedules;
  ScheduleModel? _scheduleModel;

  List<ScheduleModel> get getlistSchedules => _listSchedules;
  ScheduleModel? get getscheduleModel => _scheduleModel;

  void selectedPatient(ScheduleModel newPatient) {
    _scheduleModel = newPatient;
    notifyListeners();
  }
}
