class DoctorModel {
  List data;
  String message;

  DoctorModel({
    required this.data,
    required this.message,
  });
  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        data: json["data"],
        message: json["message"],
      );
}

class DataDoctor {
  String strNum;
  String name;
  String competency;
  String pob;
  String dob;
  String gender;
  bool married;
  String phone;
  String email;
  String lastEducation;
  int gradYear;
  String expYear;
  String address;
  String urlProfile;
  String userId;
  // String specialist;
  // int startTime;
  // int? endTime;
  // DateTime? dateTime;

  DataDoctor({
    required this.strNum,
    required this.name,
    required this.competency,
    required this.pob,
    required this.dob,
    required this.gender,
    required this.married,
    required this.phone,
    required this.email,
    required this.lastEducation,
    required this.gradYear,
    required this.expYear,
    required this.address,
    required this.urlProfile,
    required this.userId,
    // required this.specialist,
    // required this.startTime,
    // this.endTime,
    // this.dateTime,
  });
}

// final List<DoctorModel> listDoctors = [
//   DoctorModel(
//       urlProfile:
//           "https://calonpengangguran.com/wp-content/uploads/2019/10/close-up-1-FILEminimizer.jpg",
//       name: "Dr. Abednego",
//       specialist: "Docter Umum",
//       startTime: 0,
//       dateTime: DateTime(2022, 12, 10)),
//   DoctorModel(
//       urlProfile:
//           "https://calonpengangguran.com/wp-content/uploads/2019/10/close-up-1-FILEminimizer.jpg",
//       name: "Dr. Abednego",
//       specialist: "Docter Umum",
//       startTime: 1,
//       dateTime: DateTime(2022, 12, 10)),
//   DoctorModel(
//       urlProfile:
//           "https://calonpengangguran.com/wp-content/uploads/2019/10/close-up-1-FILEminimizer.jpg",
//       name: "Dr. Alief",
//       specialist: "Docter Umum",
//       startTime: 3,
//       dateTime: DateTime(2022, 12, 10)),
//   DoctorModel(
//       urlProfile:
//           "https://calonpengangguran.com/wp-content/uploads/2019/10/close-up-1-FILEminimizer.jpg",
//       name: "Dr. Natasya",
//       specialist: "Docter Umum",
//       startTime: 2,
//       dateTime: DateTime(2022, 12, 10)),
//   DoctorModel(
//       urlProfile:
//           "https://calonpengangguran.com/wp-content/uploads/2019/10/close-up-1-FILEminimizer.jpg",
//       name: "Dr. Natasya",
//       specialist: "Docter Umum",
//       startTime: 3,
//       dateTime: DateTime(2022, 12, 10)),
//   DoctorModel(
//       urlProfile:
//           "https://calonpengangguran.com/wp-content/uploads/2019/10/close-up-1-FILEminimizer.jpg",
//       name: "Dr. Putri",
//       specialist: "Docter Umum",
//       startTime: 2,
//       dateTime: DateTime(2022, 12, 10)),
//   DoctorModel(
//       urlProfile:
//           "https://calonpengangguran.com/wp-content/uploads/2019/10/close-up-1-FILEminimizer.jpg",
//       name: "Dr. Geyrandra",
//       specialist: "Docter Umum",
//       startTime: 1,
//       dateTime: DateTime(2022, 12, 10)),
//   DoctorModel(
//       urlProfile:
//           "https://calonpengangguran.com/wp-content/uploads/2019/10/close-up-1-FILEminimizer.jpg",
//       name: "Dr. Rewina",
//       specialist: "Docter Umum",
//       startTime: 1,
//       dateTime: DateTime(2022, 12, 10)),
//   DoctorModel(
//       urlProfile:
//           "https://calonpengangguran.com/wp-content/uploads/2019/10/close-up-1-FILEminimizer.jpg",
//       name: "Dr. Zakiah",
//       specialist: "Docter Umum",
//       startTime: 3,
//       dateTime: DateTime(2022, 12, 10)),
//   DoctorModel(
//       urlProfile:
//           "https://calonpengangguran.com/wp-content/uploads/2019/10/close-up-1-FILEminimizer.jpg",
//       name: "Dr. Zakiah",
//       specialist: "Docter Umum",
//       startTime: 0,
//       dateTime: DateTime(2022, 12, 10))
// ];
