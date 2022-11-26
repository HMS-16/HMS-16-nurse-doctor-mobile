import 'package:flutter/material.dart';
import 'package:hms_16/screens/patient/patient_detail/patient_profile.dart';

class PatientDetail extends StatefulWidget {
  const PatientDetail({super.key});

  @override
  State<PatientDetail> createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: AppBar(
            title: const Text('Patient Detail'),
            bottom: const TabBar(
              labelColor: Color.fromRGBO(17, 83, 181, 1),
              unselectedLabelColor: Color.fromRGBO(96, 140, 206, 0.5),
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  child: Text(
                    'Patient  Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Medical Record',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    '''Medical Measurement''',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            PatientProfile(),
            Icon(Icons.ac_unit_outlined),
            Icon(Icons.pages_outlined),
          ],
        ),
      ),
    );
  }
}
