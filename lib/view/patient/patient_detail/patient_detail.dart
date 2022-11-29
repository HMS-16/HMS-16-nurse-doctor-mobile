import 'package:flutter/material.dart';
import 'package:hms_16/view/patient/patient_detail/medic_diagnosis.dart';
import 'package:hms_16/view/patient/patient_detail/medic_record.dart';

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
            title: const Text(
              'Patient Detail',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            bottom: TabBar(
              labelColor: Color.fromRGBO(17, 83, 181, 1),
              unselectedLabelColor: Color.fromRGBO(96, 140, 206, 0.5),
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  child: Column(
                    children: [
                      Text(
                        'Patient',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    children: [
                      Text(
                        'Medical',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Record',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    children: [
                      Text(
                        'Medical',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Diagnosis',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Icon(Icons.pages_outlined),
            MedicalRecord(),
            MedicalDiagnosis(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff9B1A1A),
              foregroundColor: Colors.white,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'End Case',
              style: TextStyle(fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }
}
