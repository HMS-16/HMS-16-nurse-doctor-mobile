class ConditionModel {
  String nurse;
  String patient;
  DateTime date;
  int time;
  int height;
  int weight;
  String bloodPressure;
  int sugarAnalysis;
  double temperature;
  int restHeartRate;
  int breathRate;
  String? note;

  ConditionModel({
    required this.nurse,
    required this.patient,
    required this.date,
    required this.time,
    required this.height,
    required this.weight,
    required this.bloodPressure,
    required this.sugarAnalysis,
    required this.temperature,
    required this.restHeartRate,
    required this.breathRate,
    this.note,
  });
}
