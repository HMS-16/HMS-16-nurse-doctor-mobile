class DoctorModels {
  DoctorModels({
    required this.data,
    required this.message,
  });

  List data;
  String message;

  factory DoctorModels.fromJson(Map<String, dynamic> json) => DoctorModels(
        data: json["data"],
        message: json["message"],
      );
}

class DataDoctor {
  DataDoctor({
    required this.strNum,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.email,
    required this.role,
  });

  String strNum;
  String createdAt;
  String updatedAt;
  String name;
  String email;
  int role;
}
