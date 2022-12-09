import 'package:flutter/material.dart';
import 'package:hms_16/screens/navbar/schedule/nurse/change_schedule_bynurse.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/screens/navbar/schedule/nurse/detail_schedule_bynurse.dart';
import 'package:hms_16/screens/notification.dart';
import 'package:hms_16/screens/profile/profile.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:hms_16/widget/patientSchedule_card.dart';
import 'package:intl/intl.dart';

class ViewScheduleNurse extends StatefulWidget {
  const ViewScheduleNurse({super.key});

  @override
  State<ViewScheduleNurse> createState() => _ViewScheduleNurseState();
}

DateTime selectedDate = DateTime.now();
DateTime prevDate =
    DateTime(selectedDate.year, selectedDate.month, selectedDate.day - 1);
DateTime nextDate =
    DateTime(selectedDate.year, selectedDate.month, selectedDate.day + 1);

class _ViewScheduleNurseState extends State<ViewScheduleNurse> {
  @override
  Widget build(BuildContext context) {
    pickDate() async {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (pickedDate != null && pickedDate != selectedDate) {
        setState(() {
          selectedDate = pickedDate;
        });
      }
    }

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: cBlack),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Schedule',
            style: textStyle.copyWith(
                fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
          ),
          actions: [
            IconButton(
              onPressed: () {
                navPushTransition(context, const NotificationPage());
              },
              icon: const Icon(Icons.notifications_none),
            ),
            IconButton(
              onPressed: () {
                navPushTransition(context, ProfilePage());
              },
              icon: const Icon(Icons.account_circle_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ListTile(
                title: Row(
                  children: [
                    const SizedBox(
                      width: 8.0,
                    ),
                    TextButton(
                      onPressed: () {
                        pickDate();
                      },
                      child: Text(
                        DateFormat.MMMM().format(selectedDate),
                        style: textStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: cBlackBase),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_drop_down_outlined)),
                  ],
                ),
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search)),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  )
                ], borderRadius: BorderRadius.circular(12), color: cWhiteBase),
                child: ListTile(
                    leading: IconButton(
                        onPressed: () {
                          final changeData =
                              selectedDate.millisecondsSinceEpoch - 86400000;
                          DateTime cvData =
                              DateTime.fromMillisecondsSinceEpoch(changeData);
                          setState(() {
                            selectedDate = cvData;
                          });
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    title: TextButton(
                      onPressed: () {
                        pickDate();
                      },
                      child: Text(
                        DateFormat("EEE, d-M-y").format(selectedDate),
                        textAlign: TextAlign.center,
                        style: textStyle.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: cBlackBase),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        final changeData =
                            selectedDate.millisecondsSinceEpoch + 86400000;
                        DateTime cvData =
                            DateTime.fromMillisecondsSinceEpoch(changeData);
                        setState(() {
                          selectedDate = cvData;
                        });
                      },
                      icon: const Icon(Icons.arrow_forward_ios),
                    )),
              ),
              const SizedBox(
                height: 24.0,
              ),
              PatientScheduleCard(
                disease: "Headache",
                doctorName: "Abednego",
                patientName: "Alief Rachman",
                nurseName: "Nastasya",
                time: "$valueDropdown",
                onPressed: () {
                  navPushTransition(context, const DetailScheduleNurse());
                },
              ),
              PatientScheduleCard(
                disease: "Stomatch ache",
                doctorName: "Abednego",
                patientName: "Nurul Zakiah",
                nurseName: "Nastasya",
                time: "1.30 pm - 2.30 pm",
                onPressed: () {
                  navPushTransition(context, const DetailScheduleNurse());
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const DetailScheduleNurse(),
                  //     ));
                },
              ),
            ],
          ),
        ));
  }
}
