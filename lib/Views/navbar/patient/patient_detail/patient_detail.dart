import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/views/navbar/patient/patient_detail/medic_diagnosis.dart';
import 'package:hms_16/views/navbar/patient/patient_detail/medic_record.dart';

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
              unselectedLabelColor: cPrimaryLight.withOpacity(0.4),
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  child: Text(
                    'Patient\nProfile',
                    textAlign: TextAlign.center,
                    style: textStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                Tab(
                  child: Text(
                    'Medical\nRecord',
                    textAlign: TextAlign.center,
                    style: textStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                Tab(
                  child: Text(
                    'Medical\nDiagnose',
                    // maxLines: 2,
                    textAlign: TextAlign.center,
                    style: textStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Icon(Icons.ac_unit),
            MedicalRecord(),
            MedicalDiagnosis(),
          ],
        ),
      ),
    );
  }
}
