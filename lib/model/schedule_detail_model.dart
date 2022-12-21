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

  // Map<String, dynamic> toJson() => {
  //       "data": data.toJson(),
  //       "message": message,
  //     };
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

  // factory Data.fromJson(Map<String, dynamic> json) => Data(
  //       patientId: json["patient_id"],
  //       patient: Patient.fromJson(json["patient"]),
  //       medical:
  //           List<Medical>.from(json["medical"].map((x) => Medical.fromJson(x))),
  //       status: json["status"],
  //       statusString: json["status_string"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "patient_id": patientId,
  //       "patient": patient.toJson(),
  //       "medical": List<dynamic>.from(medical.map((x) => x.toJson())),
  //       "status": status,
  //       "status_string": statusString,
  //     };
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

  // Map<String, dynamic> toJson() => {
  //       "schedule": schedule.toJson(),
  //       "condition": condition.toJson(),
  //       "diagnose": diagnose.toJson(),
  // };
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

  // factory Condition.fromJson(Map<String, dynamic> json) => Condition(
  //       id: json["id"],
  //       registerDate: json["register_date"],
  //       nurseId: json["nurse_id"],
  //       name: json["name"],
  //       height: json["height"],
  //       weight: json["weight"],
  //       bloodPressure: json["blood_pressure"],
  //       sugarAnalysis: json["sugar_analysis"],
  //       bodyTemperature: json["body_temperature"],
  //       heartRate: json["heart_rate"],
  //       breathRate: json["breath_rate"],
  //       cholesterol: json["cholesterol"],
  //       note: json["note"],
  //       scheduleId: json["schedule_id"],
  //       time: json["time"],
  //       status: json["status"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "register_date": registerDate,
  //       "nurse_id": nurseId,
  //       "name": name,
  //       "height": height,
  //       "weight": weight,
  //       "blood_pressure": bloodPressure,
  //       "sugar_analysis": sugarAnalysis,
  //       "body_temperature": bodyTemperature,
  //       "heart_rate": heartRate,
  //       "breath_rate": breathRate,
  //       "cholesterol": cholesterol,
  //       "note": note,
  //       "schedule_id": scheduleId,
  //       "time": time,
  //       "status": status,
  //     };
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

  // factory Diagnose.fromJson(Map<String, dynamic> json) => Diagnose(
  //       id: json["id"],
  //       registerDate: json["register_date"],
  //       doctorId: json["doctor_id"],
  //       name: json["name"],
  //       diagnose: json["diagnose"],
  //       prescription: json["prescription"],
  //       scheduleId: json["schedule_id"],
  //       time: json["time"],
  //       status: json["status"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "register_date": registerDate,
  //       "doctor_id": doctorId,
  //       "name": name,
  //       "diagnose": diagnose,
  //       "prescription": prescription,
  //       "schedule_id": scheduleId,
  //       "time": time,
  //       "status": status,
  //     };
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

  // factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
  //       id: json["ID"],
  //       createdAt: DateTime.parse(json["CreatedAt"]),
  //       updatedAt: DateTime.parse(json["UpdatedAt"]),
  //       deletedAt: json["DeletedAt"],
  //       patientId: json["patient_id"],
  //       doctorId: json["doctor_id"],
  //       nurseId: json["nurse_id"],
  //       date: json["date"],
  //       timeId: json["time_id"],
  //       status: json["status"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "ID": id,
  //       "CreatedAt": createdAt.toIso8601String(),
  //       "UpdatedAt": updatedAt.toIso8601String(),
  //       "DeletedAt": deletedAt,
  //       "patient_id": patientId,
  //       "doctor_id": doctorId,
  //       "nurse_id": nurseId,
  //       "date": date,
  //       "time_id": timeId,
  //       "status": status,
  //     };
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

  // factory Patient.fromJson(Map<String, dynamic> json) => Patient(
  //     id: json["id"],
  //     createdAt: DateTime.parse(json["created_at"]),
  //     updatedAt: DateTime.parse(json["updated_at"]),
  //     name: json["name"],
  //     pob: json["pob"],
  //     dob: DateTime.parse(json["dob"]),
  //     gender: json["gender"],
  //     married: json["married"],
  //     bloodType: json["blood_type"],
  //     phoneNum: json["phone_num"],
  //     email: json["email"],
  //     address: json["address"],
  //     district: json["district"],
  //     city: json["city"],
  //     province: json["province"],
  //     nameFamily: json["name_family"],
  //     relationshipFamily: json["relationship_family"],
  //     phoneNumFamily: json["phone_num_family"],
  //     emailFamily: json["email_family"],
  //     addressFamily: json["address_family"],
  //     districtFamily: json["district_family"],
  //     cityFamily: json["city_family"],
  //     provinceFamily: json["province_family"],
  //     status: json["status"],
  //     adminId: json["admin_id"],
  // );

  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "created_at": createdAt.toIso8601String(),
  //     "updated_at": updatedAt.toIso8601String(),
  //     "name": name,
  //     "pob": pob,
  //     "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
  //     "gender": gender,
  //     "married": married,
  //     "blood_type": bloodType,
  //     "phone_num": phoneNum,
  //     "email": email,
  //     "address": address,
  //     "district": district,
  //     "city": city,
  //     "province": province,
  //     "name_family": nameFamily,
  //     "relationship_family": relationshipFamily,
  //     "phone_num_family": phoneNumFamily,
  //     "email_family": emailFamily,
  //     "address_family": addressFamily,
  //     "district_family": districtFamily,
  //     "city_family": cityFamily,
  //     "province_family": provinceFamily,
  //     "status": status,
  //     "admin_id": adminId,
  // };
}
