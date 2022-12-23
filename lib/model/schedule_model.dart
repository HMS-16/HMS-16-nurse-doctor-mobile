class ScheduleModel {
  ScheduleModel({
    required this.data,
    required this.message,
  });

  List<DataSchedule> data;
  String message;

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        data: json["data"] == null ? [] : List<DataSchedule>.from(json["data"]!.map((x) => DataSchedule.fromJson(x))),
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
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.doctorId,
    this.nurseId,
    this.timeId,
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
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  String? doctorId;
  String? nurseId;
  int? timeId;

  factory DataSchedule.fromJson(Map<String, dynamic> json){ 
        return DataSchedule(
        id: json["id"] ?? 0,
        patientId: json["patient_id"] ?? "",
        date: json["date"] ?? "",
        shift: json["shift"] ?? "",
        name: json["name"] ?? "",
        doctor: json["doctor"] ?? "",
        nurse: json["nurse"] ?? "",
        status: json["status"] ?? false,
        statusString: json["status_string"] ?? "",
    );
  }
}
