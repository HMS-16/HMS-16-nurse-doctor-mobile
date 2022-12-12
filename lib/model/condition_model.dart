class ConditionModel {
  DateTime date;
  int height;
  int weight;
  String bloodPressure;
  int sugarAnalysis;
  double temperature;
  int restHeartRate;
  int breathRate;
  String? note;

  ConditionModel({
    required this.date,
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
