import 'package:flutter/material.dart';
import 'package:hms_16/pages/nurse/schedule/patient_profile_bynurse.dart';
import 'package:hms_16/style/theme.dart';

class PatientDetailNurse extends StatefulWidget {
  const PatientDetailNurse({super.key});

  @override
  State<PatientDetailNurse> createState() => _PatientDetailNurseState();
}

class _PatientDetailNurseState extends State<PatientDetailNurse> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: AppBar(
            iconTheme: IconThemeData(color: cBlack),
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              'Patient Detail',
              style: textStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
            ),
            bottom: TabBar(
              labelColor: cPrimaryBase,
              unselectedLabelColor: cPrimaryLight,
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  child: Text('Patient\nProfile',
                      textAlign: TextAlign.center,
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 14)),
                ),
                Tab(
                  child: Text('Medical\nRecord',
                      textAlign: TextAlign.center,
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 14)),
                ),
                Tab(
                  child: Text('Medical\nMeasurement',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 14)),
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            PatientProfileNurse(),
            Icon(Icons.ac_unit_outlined),
            Icon(Icons.pages_outlined),
          ],
        ),
      ),
    );
  }
}
