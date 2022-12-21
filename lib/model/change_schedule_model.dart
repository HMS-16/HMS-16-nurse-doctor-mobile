class ChangeScheduleModel {
  String? date;
  int? timeId;

  ChangeScheduleModel({this.date, this.timeId});

  ChangeScheduleModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    timeId = json['time_id'];
  }

  Map<String, dynamic> toJson() => {'date': date, 'time_id': timeId};
}
