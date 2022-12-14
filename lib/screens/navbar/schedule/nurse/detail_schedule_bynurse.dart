import 'package:flutter/material.dart';
import 'package:hms_16/model/doctor_model.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/screens/navbar/patient/patient_detail/patient_detail.dart';
import 'package:hms_16/screens/navbar/schedule/nurse/change_doctor_bynurse.dart';
import 'package:hms_16/screens/navbar/schedule/nurse/change_schedule_bynurse.dart';
import 'package:hms_16/view_model/doctor_view_model.dart';
import 'package:hms_16/view_model/patient_view_model.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:provider/provider.dart';

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
          'Appointment Detail',
          style: textStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
        ),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Consumer<PatientViewModel>(
            builder: (context, value, child) {
              return Column(
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
                            value.person!.name,
                            style: textStyle.copyWith(
                                color: cBlackBase,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            "Register Date : ${value.person!.register}",
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
                                navPushTransition(
                                    context, const PatientDetail());
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
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                        color: cWhiteBase),
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
                                    width: 53,
                                    height: 53,
                                    child: CircleAvatar()),
                                Expanded(
                                  child: ListTile(
                                      title: Text(
                                        value.person!.doctor,
                                        style: textStyle.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: cBlackBase),
                                      ),
                                      trailing: value.person!.progress
                                          ? TextButton(
                                              onPressed: () {
                                                navPushTransition(context,
                                                    const ChangeDoctorByNurse());
                                              },
                                              child: Text(
                                                "Change",
                                                style: textStyle.copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    color: cPrimaryBase),
                                              ),
                                            )
                                          : Text("")),
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
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                        color: cWhiteBase),
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
                                    value.person!.nurse,
                                    style: textStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: cBlackBase),
                                  ),
                                  trailing: value.person!.progress
                                      ? TextButton(
                                          onPressed: () async {
                                            Future.delayed(
                                                const Duration(seconds: 2), () {
                                              Navigator.pop(context);
                                            });
                                            await showDialog<void>(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15))),
                                                  title: Text(
                                                    "Coming soon!",
                                                    textAlign: TextAlign.center,
                                                    style: textStyle.copyWith(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
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
                                        )
                                      : Text("")),
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
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                        color: cWhiteBase),
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
                              value.person!.time == 0
                                  ? "1.00 pm - 1.30 pm"
                                  : value.person!.time == 1
                                      ? "1.30 pm - 2.00 pm"
                                      : value.person!.time == 2
                                          ? "2.00 pm - 2.30 pm"
                                          : "2.30 pm - 3.00 pm",
                              style: textStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: cBlackBase),
                            ),
                            Expanded(
                              child: ListTile(
                                  trailing: value.person!.progress
                                      ? TextButton(
                                          onPressed: () {
                                            navPushTransition(context,
                                                const ChangeScheduleByNurse());
                                          },
                                          child: Text(
                                            "Change",
                                            style: textStyle.copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                color: cPrimaryBase),
                                          ),
                                        )
                                      : Text("")),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          )),
    );
  }
}
