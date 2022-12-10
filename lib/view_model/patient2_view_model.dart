import 'package:flutter/material.dart';
import 'package:hms_16/model/doctor_model.dart';
import 'doctor_view_model.dart';

class PatientModel2 {
  String name;
  String medRecord;
  String gender;
  String bloodType;
  String dateBirth;
  String status;
  String age;
  String address;
  String phone;
  String register;
  String disease;
  String doctor;
  String nurse;
  DateTime schedule;
  int time;
  bool progress;

  PatientModel2(
    this.name,
    this.medRecord,
    this.gender,
    this.bloodType,
    this.dateBirth,
    this.status,
    this.age,
    this.address,
    this.phone,
    this.register,
    this.disease,
    this.progress, {
    required this.doctor,
    required this.nurse,
    required this.time,
    required this.schedule,
  });
}

final List<PatientModel2> patients2 = [
  PatientModel2(
      'Arjen Robben',
      '2022P1',
      'Male',
      'O',
      'Belanda, 23-01-1984',
      'Married',
      '38',
      'Jl. Belanda Eropa',
      '0813 1234 1010',
      'June, 2022',
      'Fever',
      true,
      doctor: "Alief",
      nurse: "Nurul Zakiah",
      schedule: DateTime(2022, 12, 10),
      time: 2),
  PatientModel2(
      'Bastian Schweinsteiger',
      '2022P2',
      'Male',
      'A',
      'Jerman, 01-08-1984',
      'Married',
      '38',
      'Jl. Jerman Eropa',
      '0813 1234 3131',
      'January, 2022',
      'Indigestion',
      true,
      schedule: DateTime(2022, 12, 11),
      doctor: "Abednego",
      nurse: "Nastasya",
      time: 1),
  PatientModel2(
      'Franck Ribery',
      '2022P3',
      'Male',
      'B',
      'Paris, 17-05-1984',
      'Married',
      '38',
      'Jl. Prancis Eropa',
      '0813 1234 0707',
      'October, 2022',
      'ACL',
      true,
      doctor: "Geyandra",
      schedule: DateTime(2022, 12, 12),
      nurse: "Putri",
      time: 3),
  PatientModel2(
      'Thomas Muller',
      '2022P4',
      'Male',
      'AB',
      'Munich, 13-09-1989',
      'Single',
      '33',
      'Jl. Munich Jerman',
      '0813 1234 2525',
      'August, 2022',
      'Sprain',
      true,
      doctor: "Rewina",
      nurse: "Mitha",
      schedule: DateTime(2022, 12, 11),
      time: 0),
];

class PatientViewModel2 extends ChangeNotifier {
  List<PatientModel2> _patients2 = patients2;
  PatientModel2? _patient2;

  List<DoctorModel> _listDoctors = listDoctors;
  DoctorModel? _doctorModel;

  List<PatientModel2> get persons2 => _patients2;
  PatientModel2? get person2 => _patient2;

  List<DoctorModel> get getlistDoctor => _listDoctors;
  DoctorModel? get getdoctorModel => _doctorModel;

  void selectPatient(PatientModel2 newPatient2) {
    _patient2 = newPatient2;
    notifyListeners();
  }

  void patientChangeDoctor() {
    _patients2.indexWhere((element) => element.doctor == _doctorModel!.name);
    print("TESTING ======= ${_doctorModel!.name}");
    notifyListeners();
  }
}
