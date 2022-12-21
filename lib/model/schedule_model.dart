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

  // Map<String, dynamic> toJson() => {
  //     "data": List<dynamic>.from(data.map((x) => x.toJson())),
  //     "message": message,
  // };
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

  // factory DataSchedule.fromJson(Map<String, dynamic> json) => DataSchedule(
  //     id: json["id"],
  //     patientId: json["patient_id"],
  //     date: json["date"],
  //     shift: json["shift"],
  //     name: json["name"],
  //     doctor: json["doctor"],
  //     nurse: json["nurse"],
  //     status: json["status"],
  //     statusString: json["status_string"],
  // );

  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "patient_id": patientId,
  //     "date": date,
  //     "shift": shift,
  //     "name": name,
  //     "doctor": doctor,
  //     "nurse": nurse,
  //     "status": status,
  //     "status_string": statusString,
  // };
}



// class ScheduleModel {
//   // String scheduleId;
//   String patientId;
//   String doctor;
//   String nurse;
//   DateTime date;
//   DateTime start_time;
//   DateTime end_time;

//   ScheduleModel({
//     required this.patientId,
//     required this.doctor,
//     required this.nurse,
//     // required this.scheduleId,
//     required this.date,
//     required this.start_time,
//     required this.end_time,
//   });
// }

// final List<ScheduleModel> listSchedules = [
//   ScheduleModel(
//     // scheduleId: "SC01",
//     patientId: "P01",
//     doctor: "Dr. Prayogi",
//     nurse: "Baiq Nastasya",
//     date: DateTime(2022, 12, 19),
//     start_time: DateTime(2022, 12, 13, 09, 0),
//     end_time: DateTime(2022, 12, 13, 12, 0),
//   ),
//   ScheduleModel(
//     // scheduleId: "SC02",
//     patientId: "P02",
//     doctor: "Dr. Abednego",
//     nurse: "Nurul Zakiah",
//     date: DateTime(2022, 12, 19),
//     start_time: DateTime(2022, 12, 12, 13, 0),
//     end_time: DateTime(2022, 12, 12, 16, 0),
//   ),
//   // ScheduleModel(
//   //   // scheduleId: "SC03",
//   //   patientId: "P03",
//   //   doctor: "Dr. Abednego",
//   //   nurse: "Nurul Zakiah",
//   //   date: DateTime(2022, 12, 19),
//   //   start_time: DateTime(2022, 12, 12, 18, 0),
//   //   end_time: DateTime(2022, 12, 12, 21, 0),
//   // ),
//   // ScheduleModel(
//   //   // scheduleId: "SC04",
//   //   patientId: "P04",
//   //   doctor: "Dr. Abednego",
//   //   nurse: "Nurul Zakiah",
//   //   date: DateTime(2022, 12, 19),
//   //   start_time: DateTime(2022, 12, 12, 13, 0),
//   //   end_time: DateTime(2022, 12, 12, 16, 0),
//   // ),
//   // ScheduleModel(
//   //   // scheduleId: "SC04",
//   //   patientId: "P05",
//   //   doctor: "Dr. Abednego",
//   //   nurse: "Nurul Zakiah",
//   //   date: DateTime(2022, 12, 19),
//   //   start_time: DateTime(2022, 12, 12, 13, 0),
//   //   end_time: DateTime(2022, 12, 12, 16, 0),
//   // ),
//   // ScheduleModel(
//   //   // scheduleId: "SC04",
//   //   patientId: "P06",
//   //   doctor: "Dr. Abednego",
//   //   nurse: "Nurul Zakiah",
//   //   date: DateTime(2022, 12, 18),
//   //   start_time: DateTime(2022, 12, 12, 13, 0),
//   //   end_time: DateTime(2022, 12, 12, 16, 0),
//   // ),
//   // ScheduleModel(
//   //   // scheduleId: "SC04",
//   //   patientId: "P07",
//   //   doctor: "Dr. Abednego",
//   //   nurse: "Nurul Zakiah",
//   //   date: DateTime(2022, 12, 18),
//   //   start_time: DateTime(2022, 12, 12, 13, 0),
//   //   end_time: DateTime(2022, 12, 12, 16, 0),
//   // ),
//   // ScheduleModel(
//   //   // scheduleId: "SC04",
//   //   patientId: "P08",
//   //   doctor: "Dr. Abednego",
//   //   nurse: "Nurul Zakiah",
//   //   date: DateTime(2022, 12, 18),
//   //   start_time: DateTime(2022, 12, 12, 13, 0),
//   //   end_time: DateTime(2022, 12, 12, 16, 0),
//   // ),
// ];