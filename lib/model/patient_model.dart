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
  String status;

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

// final List<PatientModel> patients = [
//   PatientModel(
//       'Arjen Robben',
//       '2022P1',
//       'Male',
//       'O',
//       'Belanda, 23-01-1984',
//       'Married',
//       '38',
//       'Jl. Belanda Eropa',
//       '0813 1234 1010',
//       'June, 2022',
//       'Fever',
//       true,
//       doctor: "Alief",
//       nurse: "Nurul Zakiah",
//       schedule: DateTime(2022, 12, 14),
//       time: 2),
//   PatientModel(
//       'Bastian Schweinsteiger',
//       '2022P2',
//       'Male',
//       'A',
//       'Jerman, 01-08-1984',
//       'Married',
//       '38',
//       'Jl. Jerman Eropa',
//       '0813 1234 3131',
//       'January, 2022',
//       'Indigestion',
//       true,
//       schedule: DateTime(2022, 12, 13),
//       doctor: "Abednego",
//       nurse: "Nastasya",
//       time: 1),
//   PatientModel(
//       'Franck Ribery',
//       '2022P3',
//       'Male',
//       'B',
//       'Paris, 17-05-1984',
//       'Married',
//       '38',
//       'Jl. Prancis Eropa',
//       '0813 1234 0707',
//       'October, 2022',
//       'ACL',
//       true,
//       doctor: "Geyandra",
//       schedule: DateTime(2022, 12, 12),
//       nurse: "Putri",
//       time: 3),
//   PatientModel(
//       'Thomas Muller',
//       '2022P4',
//       'Male',
//       'AB',
//       'Munich, 13-09-1989',
//       'Single',
//       '33',
//       'Jl. Munich Jerman',
//       '0813 1234 2525',
//       'August, 2022',
//       'Sprain',
//       true,
//       doctor: "Rewina",
//       nurse: "Mitha",
//       schedule: DateTime(2022, 12, 14),
//       time: 0),
// ];
