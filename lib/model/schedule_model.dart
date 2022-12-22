class ScheduleModel {
  ScheduleModel({
    required this.data,
    required this.message,
  });

  List data;
  String message;

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        data: json["data"],
        message: json["message"],
      );
}

class DataSchedule {
  DataSchedule({
    required this.id,
    required this.patientId,
    required this.date,
    required this.shift,
    required this.name,
    required this.doctor,
    required this.nurse,
    required this.status,
    required this.statusString,
  });

  int id;
  String patientId;
  String date;
  String shift;
  String name;
  String doctor;
  String nurse;
  bool status;
  String statusString;
}
