import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:hms_16/utils/constant.dart';

class PatientScheduleCard extends StatelessWidget {
  const PatientScheduleCard(
      {super.key,
      required this.patientName,
      required this.disease,
      required this.doctorName,
      required this.nurseName,
      required this.time,
      required this.onPressed});

  final String patientName;
  final String disease;
  final String doctorName;
  final String nurseName;
  final String time;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue,
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
                            disease,
                            style: textStyle.copyWith(
                              color: cBlackLightest,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
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
                            time,
                            style: textStyle.copyWith(
                                color: cBlackLightest,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListTile(
                            trailing: Badge(
                          badgeColor: cSecondaryLightest,
                          padding: const EdgeInsets.all(10),
                          shape: BadgeShape.square,
                          borderRadius: BorderRadius.circular(15),
                          toAnimate: false,
                          badgeContent: Text(
                            "Process",
                            style: TextStyle(
                              color: cPrimaryBase,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
