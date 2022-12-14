class ScheduleModel {
  String scheduleId;
  String patientId;
  String userId;
  DateTime date;
  DateTime start_time;
  DateTime end_time;

  ScheduleModel(
      {required this.patientId,
      required this.userId,
      required this.scheduleId,
      required this.date,
      required this.start_time,
      required this.end_time});
}

final List<ScheduleModel> listSchedules = [
  ScheduleModel(
      scheduleId: "SC01",
      patientId: "P01",
      userId: "DOC03",
      date: DateTime(2022, 12, 13),
      start_time: DateTime(2022, 12, 13, 09, 0),
      end_time: DateTime(2022, 12, 13, 12, 0)),
  ScheduleModel(
      scheduleId: "SC02",
      patientId: "P02",
      userId: "DOC02",
      date: DateTime(2022, 12, 12),
      start_time: DateTime(2022, 12, 12, 13, 0),
      end_time: DateTime(2022, 12, 12, 16, 0)),
  ScheduleModel(
      scheduleId: "SC03",
      patientId: "P03",
      userId: "DOC01",
      date: DateTime(2022, 12, 14),
      start_time: DateTime(2022, 12, 12, 18, 0),
      end_time: DateTime(2022, 12, 12, 21, 0)),
  ScheduleModel(
      scheduleId: "SC04",
      patientId: "P04",
      userId: "DOC04",
      date: DateTime(2022, 12, 14),
      start_time: DateTime(2022, 12, 12, 13, 0),
      end_time: DateTime(2022, 12, 12, 16, 0)),
  ScheduleModel(
      scheduleId: "SC04",
      patientId: "P04",
      userId: "DOC04",
      date: DateTime(2022, 12, 14),
      start_time: DateTime(2022, 12, 12, 13, 0),
      end_time: DateTime(2022, 12, 12, 16, 0)),
];
