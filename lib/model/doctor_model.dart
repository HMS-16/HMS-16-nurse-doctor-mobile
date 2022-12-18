class DoctorModel {
  String name;
  String urlProfile;
  String specialist;
  int startTime;
  int? endTime;
  DateTime? dateTime;

  DoctorModel({
    required this.urlProfile,
    required this.name,
    required this.specialist,
    required this.startTime,
    this.endTime,
    this.dateTime,
  });
}

final List<DoctorModel> listDoctors = [
  DoctorModel(
      urlProfile:
          "https://calonpengangguran.com/wp-content/uploads/2019/10/close-up-1-FILEminimizer.jpg",
      name: "Dr. Abednego",
      specialist: "Docter Umum",
      startTime: 0,
      dateTime: DateTime(2022, 12, 10)),
  DoctorModel(
      urlProfile:
          "https://calonpengangguran.com/wp-content/uploads/2019/10/close-up-1-FILEminimizer.jpg",
      name: "Dr. Abednego",
      specialist: "Docter Umum",
      startTime: 1,
      dateTime: DateTime(2022, 12, 10)),
  DoctorModel(
      urlProfile:
          "https://calonpengangguran.com/wp-content/uploads/2019/10/close-up-1-FILEminimizer.jpg",
      name: "Dr. Alief",
      specialist: "Docter Umum",
      startTime: 3,
      dateTime: DateTime(2022, 12, 10)),
  DoctorModel(
      urlProfile:
          "https://calonpengangguran.com/wp-content/uploads/2019/10/close-up-1-FILEminimizer.jpg",
      name: "Dr. Natasya",
      specialist: "Docter Umum",
      startTime: 2,
      dateTime: DateTime(2022, 12, 10)),
  DoctorModel(
      urlProfile:
          "https://calonpengangguran.com/wp-content/uploads/2019/10/close-up-1-FILEminimizer.jpg",
      name: "Dr. Natasya",
      specialist: "Docter Umum",
      startTime: 3,
      dateTime: DateTime(2022, 12, 10)),
  DoctorModel(
      urlProfile:
          "https://calonpengangguran.com/wp-content/uploads/2019/10/close-up-1-FILEminimizer.jpg",
      name: "Dr. Putri",
      specialist: "Docter Umum",
      startTime: 2,
      dateTime: DateTime(2022, 12, 10)),
  DoctorModel(
      urlProfile:
          "https://calonpengangguran.com/wp-content/uploads/2019/10/close-up-1-FILEminimizer.jpg",
      name: "Dr. Geyrandra",
      specialist: "Docter Umum",
      startTime: 1,
      dateTime: DateTime(2022, 12, 10)),
  DoctorModel(
      urlProfile:
          "https://calonpengangguran.com/wp-content/uploads/2019/10/close-up-1-FILEminimizer.jpg",
      name: "Dr. Rewina",
      specialist: "Docter Umum",
      startTime: 1,
      dateTime: DateTime(2022, 12, 10)),
  DoctorModel(
      urlProfile:
          "https://calonpengangguran.com/wp-content/uploads/2019/10/close-up-1-FILEminimizer.jpg",
      name: "Dr. Zakiah",
      specialist: "Docter Umum",
      startTime: 3,
      dateTime: DateTime(2022, 12, 10)),
  DoctorModel(
      urlProfile:
          "https://calonpengangguran.com/wp-content/uploads/2019/10/close-up-1-FILEminimizer.jpg",
      name: "Dr. Zakiah",
      specialist: "Docter Umum",
      startTime: 0,
      dateTime: DateTime(2022, 12, 10))
];
