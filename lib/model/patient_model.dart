class PatientModel {
  PatientModel({
    required this.data,
    required this.message,
  });

  List<DataPatient> data;
  String message;

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
        data: json["data"],
        message: json["message"],
      );

  // Map<String, dynamic> toJson() => {
  //       "data": data.toJson(),
  //       "message": message,
  //     };
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
  DateTime dob;
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
  bool status;

  factory DataPatient.fromJson(Map<String, dynamic> json) => DataPatient(
        id: json["id"],
        name: json["name"],
        pob: json["pob"],
        dob: json["DOB"],
        gender: json["gender"],
        married: json["married"],
        bloodType: json["blood_type"],
        phone: json["phone_num"],
        email: json["email"],
        address: json["address"],
        city: json["city"],
        province: json["province"],
        familyName: json["family_name"],
        relationship: json["relationship"],
        familyContact: json["family_contact"],
        status: json["status"],
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "name": 
  //       "email": email,
  //     };
}

// class PatientModel {
//   String name;
//   String medRecord;
//   String gender;
//   String bloodType;
//   String dateBirth;
//   String status;
//   String age;
//   String address;
//   String phone;
//   String register;
//   String disease;
//   bool progress;
//   String doctor;
//   String nurse;
//   DateTime schedule;
//   int time;

//   PatientModel(
//     this.name,
//     this.medRecord,
//     this.gender,
//     this.bloodType,
//     this.dateBirth,
//     this.status,
//     this.age,
//     this.address,
//     this.phone,
//     this.register,
//     this.disease,
//     this.progress, {
//     required this.doctor,
//     required this.nurse,
//     required this.time,
//     required this.schedule,
//   });
// }