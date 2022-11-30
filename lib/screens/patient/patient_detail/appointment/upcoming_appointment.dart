import 'package:flutter/material.dart';
import 'package:hms_16/screens/patient/patient_detail/appointment/widget/appointment_card.dart';

class UpcomingAppointment extends StatelessWidget {
  const UpcomingAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Upcoming Appointment",
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              AppointmentCard(
                warna: Colors.blue,
                patientName: "November 25, 2022",
                disease: "disease",
                doctorName: "doctorName",
                nurseName: "nurseName",
                time: "1.30 pm - 2.30 pm",
              ),
              SizedBox(height: 10),
              AppointmentCard(
                warna: Colors.blue,
                patientName: "Desember 25, 2022",
                disease: "disease",
                doctorName: "doctorName",
                nurseName: "nurseName",
                time: "1.30 pm - 2.30 pm",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
