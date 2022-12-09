import 'package:flutter/material.dart';
import 'package:hms_16/screens/navbar/home/homepage.dart';
import 'package:hms_16/screens/navbar/message/message.dart';
import 'package:hms_16/screens/navbar/patient/patient_screen.dart';
import 'package:hms_16/screens/navbar/schedule/nurse/view_schedule_bynurse.dart';
import 'package:hms_16/utils/constant.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currenticon = 0;
  final screen = [
    const HomePage(),
    const PatientScreen(),
    const ViewScheduleNurse(),
    const Message(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currenticon,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey.shade100,
          selectedItemColor: cPrimaryBase,
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
              label: "Appointment",
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
