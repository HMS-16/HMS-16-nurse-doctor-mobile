class ScheduleModel {
  // String scheduleId;
  String patientId;
  String doctor;
  String nurse;
  DateTime date;
  DateTime start_time;
  DateTime end_time;

  ScheduleModel({
    required this.patientId,
    required this.doctor,
    required this.nurse,
    // required this.scheduleId,
    required this.date,
    required this.start_time,
    required this.end_time,
  });
}

final List<ScheduleModel> listSchedules = [
  ScheduleModel(
    // scheduleId: "SC01",
    patientId: "P01",
    doctor: "Dr. Prayogi",
    nurse: "Baiq Nastasya",
    date: DateTime(2022, 12, 19),
    start_time: DateTime(2022, 12, 13, 09, 0),
    end_time: DateTime(2022, 12, 13, 12, 0),
  ),
  ScheduleModel(
    // scheduleId: "SC02",
    patientId: "P02",
    doctor: "Dr. Abednego",
    nurse: "Nurul Zakiah",
    date: DateTime(2022, 12, 19),
    start_time: DateTime(2022, 12, 12, 13, 0),
    end_time: DateTime(2022, 12, 12, 16, 0),
  ),
  // ScheduleModel(
  //   // scheduleId: "SC03",
  //   patientId: "P03",
  //   doctor: "Dr. Abednego",
  //   nurse: "Nurul Zakiah",
  //   date: DateTime(2022, 12, 19),
  //   start_time: DateTime(2022, 12, 12, 18, 0),
  //   end_time: DateTime(2022, 12, 12, 21, 0),
  // ),
  // ScheduleModel(
  //   // scheduleId: "SC04",
  //   patientId: "P04",
  //   doctor: "Dr. Abednego",
  //   nurse: "Nurul Zakiah",
  //   date: DateTime(2022, 12, 19),
  //   start_time: DateTime(2022, 12, 12, 13, 0),
  //   end_time: DateTime(2022, 12, 12, 16, 0),
  // ),
  // ScheduleModel(
  //   // scheduleId: "SC04",
  //   patientId: "P05",
  //   doctor: "Dr. Abednego",
  //   nurse: "Nurul Zakiah",
  //   date: DateTime(2022, 12, 19),
  //   start_time: DateTime(2022, 12, 12, 13, 0),
  //   end_time: DateTime(2022, 12, 12, 16, 0),
  // ),
  // ScheduleModel(
  //   // scheduleId: "SC04",
  //   patientId: "P06",
  //   doctor: "Dr. Abednego",
  //   nurse: "Nurul Zakiah",
  //   date: DateTime(2022, 12, 18),
  //   start_time: DateTime(2022, 12, 12, 13, 0),
  //   end_time: DateTime(2022, 12, 12, 16, 0),
  // ),
  // ScheduleModel(
  //   // scheduleId: "SC04",
  //   patientId: "P07",
  //   doctor: "Dr. Abednego",
  //   nurse: "Nurul Zakiah",
  //   date: DateTime(2022, 12, 18),
  //   start_time: DateTime(2022, 12, 12, 13, 0),
  //   end_time: DateTime(2022, 12, 12, 16, 0),
  // ),
  // ScheduleModel(
  //   // scheduleId: "SC04",
  //   patientId: "P08",
  //   doctor: "Dr. Abednego",
  //   nurse: "Nurul Zakiah",
  //   date: DateTime(2022, 12, 18),
  //   start_time: DateTime(2022, 12, 12, 13, 0),
  //   end_time: DateTime(2022, 12, 12, 16, 0),
  // ),
];