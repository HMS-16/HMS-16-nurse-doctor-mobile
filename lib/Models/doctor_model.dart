class DoctorModel {
  final String name;
  final String urlProfile;
  final String specialist;
  final int startTime;
  final int? endTime;

  DoctorModel({
    required this.urlProfile,
    required this.name,
    required this.specialist,
    required this.startTime,
    this.endTime,
  });
}
