import 'package:flutter/material.dart';
import 'package:hms_16/model/doctor_model.dart';
import 'package:hms_16/model/patient_model.dart';
import 'package:hms_16/screens/navbar/patient/patient_detail/patient_detail.dart';
import 'package:hms_16/screens/navbar/schedule/nurse/change_schedule_bynurse.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/screens/navbar/schedule/nurse/detail_schedule_bynurse.dart';
import 'package:hms_16/screens/notification.dart';
import 'package:hms_16/screens/profile/profile.dart';
import 'package:hms_16/view_model/doctor_view_model.dart';
import 'package:hms_16/view_model/patient_view_model.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:hms_16/widget/patientSchedule_card.dart';
import 'package:hms_16/widget/patient_card.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
              icon: const Icon(Icons.notifications),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: InkWell(
                onTap: () {
                  navPushTransition(context, const ProfilePage());
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image(image: AssetImage("assets/images/avatar.png")),
                ),
              ),
            )
          ],
        ),
        body: Column(
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
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
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
            // Consumer<PatientViewModel>(builder: (context, value, child) {
            //   // return PatientList(persons: patients);
            //   return PatientListSchedule(
            //     persons: patients,
            //     doctors: listDoctors,
            //   );
            // }),
          ],
        ));
  }
}

// class PatientListSchedule extends StatelessWidget {
//   final List<PatientModel> persons;
//   final List<DoctorModel> doctors;

//   const PatientListSchedule(
//       {super.key, required this.persons, required this.doctors});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.builder(
//         physics: const BouncingScrollPhysics(),
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         itemBuilder: (context, index) {
//           final person = persons.elementAt(index);
//           final doctor = doctors.elementAt(index);
//           if (DateFormat("EEE, d-M-y").format(person.schedule) ==
//               DateFormat("EEE, d-M-y").format(selectedDate)) {
//             return InkWell(
//               onTap: () {
//                 context.read<PatientViewModel>().selectedPerson(person);
//                 context.read<DoctorViewModel>().selectedDoctor(doctor);
//                 navPushTransition(context, const DetailScheduleNurse());
//               },
//               child: Builder(builder: (context) {
//                 Color lineColor = cPrimaryBase;
//                 Color fontColor = cPrimaryDark;
//                 Color badgeColor = cSecondaryLighter;
//                 String condition = 'Process';

//                 if (person.progress == false) {
//                   lineColor = cGreenLine;
//                   condition = 'Done';
//                   badgeColor = cSuccessLightest;
//                   fontColor = cSuccessDark;
//                 }
//                 return PatientScheduleCard(
//                     fontColor: fontColor,
//                     lineColor: lineColor,
//                     paintBadge: badgeColor,
//                     badgeText: condition,
//                     patientName: person.name,
//                     // disease: person.disease,
//                     doctorName: person.doctor,
//                     nurseName: person.nurse,
//                     time: person.time == 0
//                         ? "1.00 pm - 1.30 pm"
//                         : person.time == 1
//                             ? "1.30 pm - 2.00 pm"
//                             : person.time == 2
//                                 ? "2.00 pm - 2.30 pm"
//                                 : "2.30 pm - 3.00 pm");
//               }),
//             );
//           }
//           return Container();
//         },
//         itemCount: persons.length,
//       ),
//     );
//   }
// }

// class SchedulePatientList extends StatelessWidget {
//   final List<PatientModel> schedulePatients;
//   const SchedulePatientList({super.key, required this.schedulePatients});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: schedulePatients.length,
//         scrollDirection: Axis.vertical,
//         itemBuilder: (context, index) {
//           final schedulePatient = schedulePatients.elementAt(index);
//           if (DateFormat("EEE, d-M-y").format(schedulePatient.schedule) ==
//               DateFormat("EEE, d-M-y").format(selectedDate)) {
//             return PatientScheduleCard(
//               patientName: schedulePatient.name,
//               disease: schedulePatient.disease,
//               doctorName: schedulePatient.doctor,
//               nurseName: schedulePatient.nurse,
//               time: schedulePatient.time == 0
//                   ? "1.00 pm - 1.30 pm"
//                   : schedulePatient.time == 1
//                       ? "1.30 pm - 2.00 pm"
//                       : schedulePatient.time == 2
//                           ? "2.00 pm - 2.30 pm"
//                           : "2.30 pm - 3.00 pm",
//               onPressed: () {
//                 context
//                     .read<PatientViewModel>()
//                     .selectedPerson(schedulePatient);
//                 navPushTransition(context, const DetailScheduleNurse());
//               },
//             );
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }
// }