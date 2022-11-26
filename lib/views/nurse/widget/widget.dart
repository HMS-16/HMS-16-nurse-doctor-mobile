import 'package:flutter/material.dart';
import 'package:hms_16/Views/nurse/schedule/detail_schedule_bynurse.dart';
import 'package:hms_16/style/theme.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({super.key});

  final Widget? child;
  final String name;
  final String disease;
  final String doctorName;
  final String nurseName;
  final String time;
  final CircleAvatar icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
        )
      ], borderRadius: BorderRadius.circular(15), color: cWhiteBase),
      child: ListTile(
        title: Text(
          name,
          style: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(disease),
            Text("Doctor : $doctorName"),
            Text("Nurse : $nurseName"),
            Text(time),
          ],
        ),
        leading: icon,
        trailing: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailScheduleNurse(),
                  ));
            },
            icon: Icon(Icons.arrow_forward_ios)),
      ),
    );
  }
}
