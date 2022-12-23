import 'package:flutter/material.dart';
import 'package:hms_16/screens/navbar/home/homepage.dart';
import 'package:hms_16/screens/navbar/message/message.dart';
import 'package:hms_16/screens/navbar/patient/patient_screen.dart';
import 'package:hms_16/screens/navbar/schedule/view_schedule.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/view_model/schedule_view_model.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  // @override
  // void initState() {
  //   context.read<ScheduleViewModel>().getAllSchedule();
  //   super.initState();
  // }

  int currenticon = 0;
  final screen = [
    const HomePage(),
    const PatientScreen(),
    const ViewSchedule(),
    const Message(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currenticon,
          type: BottomNavigationBarType.fixed,
          backgroundColor: cWhiteBase,
          selectedItemColor: cPrimaryBase,
          unselectedItemColor: Color.fromRGBO(205, 205, 205, 1),
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
