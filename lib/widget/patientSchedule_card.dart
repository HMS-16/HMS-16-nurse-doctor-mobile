import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:hms_16/utils/constant.dart';

class PatientScheduleCard extends StatelessWidget {
  const PatientScheduleCard({
    super.key,
    required this.patientName,
    this.doctorName,
    this.nurseName,
    this.time,
    required this.lineColor,
    required this.fontColor,
  });

  final String patientName;

  final String? doctorName;
  final String? nurseName;
  final String? time;

  final Color lineColor;

  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
        )
      ], borderRadius: BorderRadius.circular(15), color: cWhiteBase),
      child: Row(
        children: [
          Container(
            width: 3.5,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  lineColor,
                  Colors.white,
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          const SizedBox(
            height: 30.0,
          ),
          Icon(
            Icons.account_circle,
            color: cPrimaryBase,
            size: 32,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          patientName,
                          style: textStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Doctor : $doctorName",
                          style: textStyle.copyWith(
                              color: cBlackBase,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Nurse : $nurseName",
                          style: textStyle.copyWith(
                              color: cBlackBase,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          time!,
                          style: textStyle.copyWith(
                              color: cBlackLightest,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Expanded(child: ListTile()),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
