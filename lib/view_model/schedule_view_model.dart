import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hms_16/model/change_schedule_model.dart';
import 'package:hms_16/model/schedule_model.dart';
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

  getAllSchedule(String date) async {
    try {
      var response = await ScheduleServices().getAllSchedule(date);

      if (response.data['data'] != null) {
        ScheduleModel modelSchedule = ScheduleModel.fromJson(response.data);

        _schedules = (modelSchedule.data)
            .map((e) => DataSchedule(
                id: e['id'],
                patientId: e['patient_id'],
                date: e['date'],
                shift: e['shift'],
                name: e['name'],
                doctor: e['doctor'],
                nurse: e['nurse'],
                status: e['status'],
                statusString: e['status_string']))
            .toList();
      } else {
        _schedules = response.data['data'] == null ? [] : [];
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
    await getAllSchedule(date);
    notifyListeners();
  }
}
