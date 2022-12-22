class ScheduleDetailModel {
  ScheduleDetailModel({
    required this.data,
    required this.message,
  });

  Data data;
  String message;

  factory ScheduleDetailModel.fromJson(Map<String, dynamic> json) =>
      ScheduleDetailModel(
        data: json["data"],
        message: json["message"],
      );
}

class Data {
  Data({
    required this.patientId,
    required this.patient,
    required this.medical,
    required this.status,
    required this.statusString,
  });

  String patientId;
  Patient patient;
  List medical;
  bool status;
  String statusString;
}

class Medical {
  Medical({
    required this.schedule,
    required this.condition,
    required this.diagnose,
  });

  Schedule schedule;
  Condition condition;
  Diagnose diagnose;

  factory Medical.fromJson(Map<String, dynamic> json) => Medical(
        schedule: json["schedule"],
        condition: json["condition"],
        diagnose: json["diagnose"],
      );
}

class Condition {
  Condition({
    required this.id,
    required this.registerDate,
    required this.nurseId,
    required this.name,
    required this.height,
    required this.weight,
    required this.bloodPressure,
    required this.sugarAnalysis,
    required this.bodyTemperature,
    required this.heartRate,
    required this.breathRate,
    required this.cholesterol,
    required this.note,
    required this.scheduleId,
    required this.time,
    required this.status,
  });

  int id;
  String registerDate;
  String nurseId;
  String name;
  String height;
  String weight;
  String bloodPressure;
  String sugarAnalysis;
  String bodyTemperature;
  String heartRate;
  String breathRate;
  String cholesterol;
  String note;
  int scheduleId;
  String time;
  bool status;
}

class Diagnose {
  Diagnose({
    required this.id,
    required this.registerDate,
    required this.doctorId,
    required this.name,
    required this.diagnose,
    required this.prescription,
    required this.scheduleId,
    required this.time,
    required this.status,
  });

  int id;
  String registerDate;
  String doctorId;
  String name;
  String diagnose;
  String prescription;
  int scheduleId;
  String time;
  bool status;
}

class Schedule {
  Schedule({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.patientId,
    required this.doctorId,
    required this.nurseId,
    required this.date,
    required this.timeId,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String patientId;
  String doctorId;
  String nurseId;
  String date;
  int timeId;
  bool status;
}

class Patient {
  Patient({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.pob,
    required this.dob,
    required this.gender,
    required this.married,
    required this.bloodType,
    required this.phoneNum,
    required this.email,
    required this.address,
    required this.district,
    required this.city,
    required this.province,
    required this.nameFamily,
    required this.relationshipFamily,
    required this.phoneNumFamily,
    required this.emailFamily,
    required this.addressFamily,
    required this.districtFamily,
    required this.cityFamily,
    required this.provinceFamily,
    required this.status,
    required this.adminId,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String pob;
  DateTime dob;
  String gender;
  bool married;
  String bloodType;
  String phoneNum;
  String email;
  String address;
  String district;
  String city;
  String province;
  String nameFamily;
  String relationshipFamily;
  String phoneNumFamily;
  String emailFamily;
  String addressFamily;
  String districtFamily;
  String cityFamily;
  String provinceFamily;
  bool status;
  String adminId;
}
