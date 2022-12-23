import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hms_16/model/change_doctor_model.dart';
import 'package:hms_16/model/change_schedule_model.dart';
import 'package:hms_16/model/schedule_model.dart';
import 'package:hms_16/services/doctor_services.dart';
import 'package:hms_16/services/schedule_services.dart';
import 'package:hms_16/utils/constant.dart';

class ScheduleViewModel extends ChangeNotifier {
  List<DataSchedule> _schedules = [];
  DataSchedule? _schedule;

  List<DataSchedule> get schedules => _schedules;
  DataSchedule? get schedule => _schedule;

  ActionState scheduleState = ActionState.none;

  void changeState(ActionState state) {
    scheduleState = state;
    notifyListeners();
  }

  getAllSchedule() async {
    changeState(ActionState.loading);
    try {
      var response = await ScheduleServices().getAllSchedule();

      if (response.statusCode == 200) {
        ScheduleModel modelSchedule = ScheduleModel.fromJson(response.data);

        _schedules = modelSchedule.data;
        print(_schedules);
        changeState(ActionState.none);
      }
    } on DioError catch (e) {
      print(e.response!.statusMessage);
      print(e.response!.statusCode);
    }
    notifyListeners();
  }

  selectedSchedule(scheduleModel) {
    _schedule = scheduleModel;
    notifyListeners();
  }

  changeSchedule(ChangeScheduleModel change, int id, date) async {
    await ScheduleServices().changeSchedule(change, id);
    await getAllSchedule();
    notifyListeners();
  }

  changeDoctor(ChangeDoctorModel doctorId, int id) async {
    await DoctorServices().changeDoctor(doctorId, id);
    await getAllSchedule();
    notifyListeners();
  }
}
