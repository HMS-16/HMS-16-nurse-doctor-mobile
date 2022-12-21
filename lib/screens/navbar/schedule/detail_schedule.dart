import 'package:flutter/material.dart';
import 'package:hms_16/model/doctor_model.dart';
import 'package:hms_16/screens/navbar/schedule/change_doctor.dart';
import 'package:hms_16/screens/navbar/schedule/change_schedule.dart';
import 'package:hms_16/screens/navbar/schedule/view_schedule.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/screens/navbar/patient/patient_detail/patient_detail.dart';
import 'package:hms_16/view_model/auth_view_model.dart';
import 'package:hms_16/view_model/doctor_view_model.dart';
import 'package:hms_16/view_model/patient_view_model.dart';
import 'package:hms_16/view_model/schedule_view_model.dart';
import 'package:hms_16/widget/dialog_validation.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailSchedule extends StatefulWidget {
  const DetailSchedule({super.key});

  @override
  State<DetailSchedule> createState() => _DetailScheduleState();
}

class _DetailScheduleState extends State<DetailSchedule> {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scheduleProvider = context.read<ScheduleViewModel>();
    final authProvider = context.read<AuthViewModel>();
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
                color: cSecondaryLightest,
              ),
              child: Consumer<ScheduleViewModel>(
                builder: (context, value, child) {
                  return ListTile(
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
                          value.schedule!.name,
                          style: textStyle.copyWith(
                              color: cBlackBase,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                      ],
                    ),
                    subtitle: GestureDetector(
                      onTap: () {
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: Text(
                                "View Patient Detail",
                                style: textStyle.copyWith(
                                  color: cPrimaryBase,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.arrow_forward,
                                color: cIcon,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
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
                color: cWhiteBase,
              ),
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
                          color: cBlackLightest,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                              width: 53, height: 53, child: CircleAvatar()),
                          Expanded(
                            child: Consumer<ScheduleViewModel>(
                                builder: (context, value, child) {
                              return ListTile(
                                title: Text(
                                  value.schedule!.doctor,
                                  style: textStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: cBlackBase),
                                ),
                                trailing: scheduleProvider.schedule!.status ==
                                            false &&
                                        authProvider.profile!.role == 2
                                    ? TextButton(
                                        onPressed: () {
                                          navPushTransition(
                                              context, const ChangeDoctor());
                                        },
                                        child: Text(
                                          "Change",
                                          style: textStyle.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              color: cPrimaryBase),
                                        ),
                                      )
                                    : Text(""),
                              );
                            }),
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
                      color: cBlackLightest,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                          width: 53, height: 53, child: CircleAvatar()),
                      Expanded(
                        child: Consumer<ScheduleViewModel>(
                            builder: (context, value, child) {
                          return ListTile(
                            title: Text(
                              value.schedule!.nurse,
                              style: textStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: cBlackBase,
                              ),
                            ),
                          );
                        }),
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
                      color: cBlackLightest,
                    ),
                  ),
                  Row(
                    children: [
                      Consumer<ScheduleViewModel>(
                        builder: (context, value, child) {
                          return Text(
                            value.schedule!.shift,
                            style: textStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: cBlackBase),
                          );
                        },
                      ),
                      Expanded(
                        child: ListTile(
                          trailing: scheduleProvider.schedule!.status == false
                              ? TextButton(
                                  onPressed: () {
                                    navPushTransition(
                                        context, const ChangeSchedule());
                                  },
                                  child: Text(
                                    "Change",
                                    style: textStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: cPrimaryBase),
                                  ),
                                )
                              : Text(""),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        //   },
        // ),
      ),
    );
  }
}
