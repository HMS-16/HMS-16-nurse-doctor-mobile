import 'package:flutter/material.dart';
import 'package:hms_16/screens/patient/patient_detail/appointment/completed_appointment.dart';
import 'package:hms_16/screens/patient/patient_detail/appointment/upcoming_appointment.dart';

import '../patient_detail/widget/text_box.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({super.key});

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const Text(
                    "Nama Pasien",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text('123456789'),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: const Color.fromRGBO(17, 83, 181, 1),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return SlideTransition(
                                  position: animation.drive(
                                    Tween(
                                        begin: const Offset(1.0, 0.0),
                                        end: Offset.zero),
                                  ),
                                  child: child,
                                );
                              },
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return const CompletedAppointment();
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: const [
                            Text("4"),
                            Text("Completed"),
                            Text("Appointment"),
                          ],
                        ),
                      ),
                      Container(
                        width: 1.5,
                        height: 50,
                        color: Colors.black,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: const Color.fromRGBO(17, 83, 181, 1),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return SlideTransition(
                                  position: animation.drive(
                                    Tween(
                                        begin: const Offset(1.0, 0.0),
                                        end: Offset.zero),
                                  ),
                                  child: child,
                                );
                              },
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return const UpcomingAppointment();
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: const [
                            Text("2"),
                            Text("Upcoming"),
                            Text("Appointment"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Doctor',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextBox(
              height: 43,
              width: double.infinity,
              child: Text('Hansi Flick'),
            ),
            const Text(
              'Nurse',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextBox(
              height: 43,
              width: double.infinity,
              child: Text('Jamal Musiala'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Gender',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextBox(
                      height: 43,
                      width: 166,
                      child: Text('Male'),
                    ),
                    Text(
                      'Blood Type',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextBox(
                      height: 43,
                      width: 166,
                      child: Text('O'),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Date of Birth',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextBox(
                      height: 43,
                      width: 166,
                      child: Text('Tokyo, 08-25-2000'),
                    ),
                    Text(
                      'Status',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextBox(
                      height: 43,
                      width: 166,
                      child: Text('Process'),
                    ),
                  ],
                ),
              ],
            ),
            const Text(
              'Age',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextBox(
              height: 43,
              width: 166,
              child: Text('22 Years'),
            ),
            const Text(
              'Address',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextBox(
              height: 43,
              width: double.infinity,
              child: Text('Jl. Jalan No.3, Kota Tiga'),
            ),
            const Text(
              'Phone Number',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextBox(
              height: 43,
              width: double.infinity,
              child: Text('+62 0813 1313 1313'),
            ),
            const Text(
              'Register Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextBox(
              height: 43,
              width: double.infinity,
              child: Text('November 10, 2022'),
            ),
            const Text(
              'Case Description',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextBox(
              width: double.infinity,
              height: 130,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Experiencing symptoms :'),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.circle,
                                  size: 10.0,
                                ),
                                SizedBox(width: 10),
                                Text('Red on the Throat'),
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.circle,
                                  size: 10.0,
                                ),
                                SizedBox(width: 10),
                                Text('The salivary glands are enlarged'),
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.circle,
                                  size: 10.0,
                                ),
                                SizedBox(width: 10),
                                Text('Mild respiratory distress'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await showDialog<void>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Are you sure to end case this patient?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Yes"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("No"),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(155, 26, 26, 1),
                minimumSize: const Size.fromHeight(51),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'End Case',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
