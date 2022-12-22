class PatientModel {
  PatientModel({
    required this.data,
    required this.message,
  });

  List data;
  String message;

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
        data: json["data"],
        message: json["message"],
      );
}

class DataPatient {
  DataPatient({
    required this.id,
    required this.name,
    required this.pob,
    required this.dob,
    required this.gender,
    required this.married,
    required this.bloodType,
    required this.phone,
    required this.email,
    required this.address,
    required this.city,
    required this.province,
    required this.familyName,
    required this.relationship,
    required this.familyContact,
    required this.status,
  });

  String id;
  String name;
  String pob;
  String dob;
  String gender;
  bool married;
  String bloodType;
  String phone;
  String email;
  String address;
  String city;
  String province;
  String familyName;
  String relationship;
  String familyContact;
  int status;
}
