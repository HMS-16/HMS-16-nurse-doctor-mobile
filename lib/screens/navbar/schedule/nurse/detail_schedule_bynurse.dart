import 'package:flutter/material.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/screens/navbar/patient/patient_detail/patient_detail.dart';
import 'package:hms_16/screens/navbar/schedule/nurse/change_doctor_bynurse.dart';
import 'package:hms_16/screens/navbar/schedule/nurse/change_schedule_bynurse.dart';
import 'package:hms_16/widget/navpush_transition.dart';

class DetailScheduleNurse extends StatefulWidget {
  const DetailScheduleNurse({super.key});

  @override
  State<DetailScheduleNurse> createState() => _DetailScheduleNurseState();
}

class _DetailScheduleNurseState extends State<DetailScheduleNurse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: cBlack),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Schedule Detail',
          style: textStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    )
                  ],
                  borderRadius: BorderRadius.circular(24),
                  color: cSecondaryLightest),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Patient",
                      style: textStyle.copyWith(
                          color: cBlackBase,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Alief Rachman",
                      style: textStyle.copyWith(
                          color: cBlackBase,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      "Register Date : Sep 16, 2022",
                      style: textStyle.copyWith(
                          color: cBlackBase,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                subtitle: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Text(
                        "View Patient Detail",
                        style: textStyle.copyWith(
                            color: cPrimaryBase,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          navPushTransition(context, const PatientDetail());
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const PatientDetail(),
                          //     ));
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: cIcon,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                )
              ], borderRadius: BorderRadius.circular(12), color: cWhiteBase),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Doctor",
                        style: textStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: cBlackLightest),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                              width: 53, height: 53, child: CircleAvatar()),
                          Expanded(
                            child: ListTile(
                              title: Text(
                                "Abednego",
                                style: textStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: cBlackBase),
                              ),
                              trailing: TextButton(
                                onPressed: () {
                                  navPushTransition(
                                      context, const ChangeDoctorByNurse());
                                },
                                child: Text(
                                  "Change",
                                  style: textStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: cPrimaryBase),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                )
              ], borderRadius: BorderRadius.circular(12), color: cWhiteBase),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nurse",
                    style: textStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: cBlackLightest),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                          width: 53, height: 53, child: CircleAvatar()),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Natasya",
                            style: textStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: cBlackBase),
                          ),
                          trailing: TextButton(
                            onPressed: () async {
                              Future.delayed(const Duration(seconds: 2), () {
                                Navigator.pop(context);
                              });
                              await showDialog<void>(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    title: Text(
                                      "Coming soon!",
                                      textAlign: TextAlign.center,
                                      style: textStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              "Change",
                              style: textStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: cPrimaryBase),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                )
              ], borderRadius: BorderRadius.circular(12), color: cWhiteBase),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Schedule",
                    style: textStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: cBlackLightest),
                  ),
                  Row(
                    children: [
                      Text(
                        "$valueDropdown",
                        style: textStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: cBlackBase),
                      ),
                      Expanded(
                        child: ListTile(
                          trailing: TextButton(
                            onPressed: () {
                              navPushTransition(
                                  context, const ChangeScheduleByNurse());
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           const ChangeScheduleByNurse(),
                              //     ));
                            },
                            child: Text(
                              "Change",
                              style: textStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: cPrimaryBase),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
