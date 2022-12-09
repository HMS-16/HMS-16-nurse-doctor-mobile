import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/widget/appointment_card.dart';

class CompletedAppointment extends StatelessWidget {
  const CompletedAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: cBlack),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Completed Appointment',
          style: textStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              AppointmentCard(
                warna: Colors.green,
                patientName: "October 25, 2022",
                disease: "disease",
                doctorName: "doctorName",
                nurseName: "nurseName",
                time: "1.30 pm - 2.30 pm",
              ),
              SizedBox(height: 10),
              AppointmentCard(
                warna: Colors.green,
                patientName: "September 25, 2022",
                disease: "disease",
                doctorName: "doctorName",
                nurseName: "nurseName",
                time: "1.30 pm - 2.30 pm",
              ),
              SizedBox(height: 10),
              AppointmentCard(
                warna: Colors.green,
                patientName: "August 25, 2022",
                disease: "disease",
                doctorName: "doctorName",
                nurseName: "nurseName",
                time: "1.30 pm - 2.30 pm",
              ),
              SizedBox(height: 10),
              AppointmentCard(
                warna: Colors.green,
                patientName: "July 25, 2022",
                disease: "disease",
                doctorName: "doctorName",
                nurseName: "nurseName",
                time: "1.30 pm - 2.30 pm",
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
