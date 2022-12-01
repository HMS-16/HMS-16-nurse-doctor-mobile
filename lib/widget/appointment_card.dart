import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.patientName,
    required this.disease,
    required this.doctorName,
    required this.nurseName,
    required this.time,
    required this.warna,
  });

  final String patientName;
  final String disease;
  final String doctorName;
  final String nurseName;
  final String time;
  final Color warna;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          )
        ],
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(253, 253, 253, 1),
      ),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  warna,
                  Colors.white,
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ListTile(
                title: Text(
                  patientName,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(time),
                    Text(disease),
                    Text("Doctor : $doctorName"),
                    Text("Nurse : $nurseName"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
