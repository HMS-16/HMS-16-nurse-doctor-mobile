class PatientModel {
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
  bool progress;

  PatientModel(
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
    this.progress,
  );
}

final List<PatientModel> patients = [
  PatientModel(
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
  ),
  PatientModel(
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
  ),
  PatientModel(
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
  ),
  PatientModel(
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
  ),
];
