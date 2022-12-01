import 'package:flutter/material.dart';
import 'package:hms_16/views/navbar/home/homepage.dart';
import 'package:hms_16/views/navbar/message/message.dart';
import 'package:hms_16/views/navbar/patient/patient_screen.dart';
import 'package:hms_16/views/navbar/schedule/doctor/view_schedule_bydoctor.dart';

class NavBarDoc extends StatefulWidget {
  NavBarDoc({super.key});

  @override
  State<NavBarDoc> createState() => _NavBarDocState();
}

class _NavBarDocState extends State<NavBarDoc> {
  int currenticon = 0;
  final screen = [
    HomePage(),
    PatientScreen(),
    ViewScheduleDoctor(),
    Message(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currenticon,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey.shade100,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black26,
          onTap: (value) {
            setState(() {
              currenticon = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.groups),
              label: "Patient",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_rounded),
              label: "Schedule",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Messages",
            ),
          ]),
      body: screen[currenticon],
    );
  }
}
