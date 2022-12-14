import 'package:flutter/material.dart';
import 'package:hms_16/screens/navbar/home/homepage_doctor.dart';
import 'package:hms_16/screens/navbar/message/message.dart';
import 'package:hms_16/screens/navbar/patient/patient_screen.dart';
import 'package:hms_16/screens/navbar/schedule/doctor/view_schedule_bydoctor.dart';

class NavBarDoc extends StatefulWidget {
  const NavBarDoc({super.key});

  @override
  State<NavBarDoc> createState() => _NavBarDocState();
}

class _NavBarDocState extends State<NavBarDoc> {
  int currenticon = 0;
  final screen = [
    const HomePageDoctor(),
    const PatientScreen(),
    const ViewScheduleDoctor(),
    const Message(),
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
          items: const [
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
