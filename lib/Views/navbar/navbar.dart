import 'package:flutter/material.dart';
import 'package:hms_16/views/navbar/home/homepage.dart';
import 'package:hms_16/views/navbar/message/message.dart';
import 'package:hms_16/views/navbar/patient/patient_screen.dart';
import 'package:hms_16/views/navbar/schedule/nurse/view_schedule_bynurse.dart';

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
