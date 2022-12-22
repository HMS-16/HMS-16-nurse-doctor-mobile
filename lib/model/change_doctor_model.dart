class ChangeDoctorModel {
  String? doctorId;

  ChangeDoctorModel({this.doctorId});

  ChangeDoctorModel.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
  }

  Map<String, dynamic> toJson() => {'doctor_id': doctorId};
}
