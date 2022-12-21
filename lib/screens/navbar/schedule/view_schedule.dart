import 'package:flutter/material.dart';
import 'package:hms_16/model/patient_model.dart';
import 'package:hms_16/model/schedule_model.dart';
import 'package:hms_16/screens/navbar/schedule/detail_schedule.dart';
import 'package:hms_16/screens/profile/profile.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/view_model/doctor_view_model.dart';
import 'package:hms_16/view_model/patient_view_model.dart';
import 'package:hms_16/view_model/schedule_view_model.dart';
import 'package:hms_16/widget/dialog_validation.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:hms_16/widget/patientSchedule_card.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ViewSchedule extends StatefulWidget {
  ViewSchedule({super.key});

  @override
  State<ViewSchedule> createState() => _ViewScheduleState();
}

DateTime selectedDate = DateTime.now();

class _ViewScheduleState extends State<ViewSchedule> {
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    context
        .read<ScheduleViewModel>()
        .getAllSchedule(DateFormat('M/d/y').format(selectedDate));
    context.read<DoctorViewModel>().getAllDoctor();
    // });
    super.initState();
  }

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
        context
            .read<ScheduleViewModel>()
            .getAllSchedule(DateFormat('M/d/y').format(selectedDate));
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
              // navPushTransition(context, const NotificationPage());
              dialogValidation(
                context: context,
                title: "Coming Soon!",
                isValidation: false,
                isImage: false,
                newPage: () async {
                  await Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pop(context);
                  });
                },
              );
            },
            icon: const Icon(Icons.notifications),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {
                navPushTransition(context, const ProfilePage());
              },
              icon: const Icon(Icons.account_circle, size: 38),
            ),
          ),
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
            trailing: IconButton(
                onPressed: () {
                  dialogValidation(
                    context: context,
                    title: "Coming Soon!",
                    isValidation: false,
                    isImage: false,
                    newPage: () async {
                      await Future.delayed(const Duration(seconds: 2), () {
                        Navigator.pop(context);
                      });
                    },
                  );
                },
                icon: const Icon(Icons.search)),
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
                      context.read<ScheduleViewModel>().getAllSchedule(
                          DateFormat('M/d/y').format(selectedDate));
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
                    context.read<ScheduleViewModel>().getAllSchedule(
                        DateFormat('M/d/y').format(selectedDate));
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                )),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Consumer<ScheduleViewModel>(builder: (context, value, child) {
            // return PatientList(persons: patients);
            return PatientListSchedule(
              schedules: context.read<ScheduleViewModel>().schedules,
              // patients: context.read<PatientViewModel>().persons,
              // doctors: listDoctors,
            );
          }),
        ],
      ),
    );
  }
}

class PatientListSchedule extends StatelessWidget {
  final List<DataSchedule> schedules;
  // final List<DataPatient> patients;

  const PatientListSchedule({
    super.key,
    required this.schedules,
    // required this.patients,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final schedule = schedules.elementAt(index);
          // final patient = patients.elementAt(index);
          // final schedule = listSchedules.elementAt(index);
          // print(schedule);
          if (schedules.isNotEmpty) {
            return InkWell(
              onTap: () {
                // context.read<PatientViewModel>().selectedPerson(patient);
                context.read<ScheduleViewModel>().selectedSchedule(schedule);
                navPushTransition(context, const DetailSchedule());
              },
              child: Builder(builder: (context) {
                Color lineColor = cPrimaryBase;
                Color fontColor = cPrimaryDark;
                Color badgeColor = cSecondaryLighter;
                String condition = 'Process';

                // if (patient.status != 0) {
                //   lineColor = cGreenLine;
                //   condition = 'Done';
                //   badgeColor = cSuccessLightest;
                //   fontColor = cSuccessDark;
                // }
                return PatientScheduleCard(
                    fontColor: fontColor,
                    lineColor: lineColor,
                    paintBadge: badgeColor,
                    badgeText: condition,
                    patientName: schedule.name,
                    // disease: person.disease,
                    doctorName: schedule.doctor,
                    nurseName: schedule.nurse,
                    // nurseName: person.nurse,
                    time: schedule.shift
                    //  == 0
                    //     ? "1.00 pm - 1.30 pm"
                    //     : person.time == 1
                    //         ? "1.30 pm - 2.00 pm"
                    //         : person.time == 2
                    //             ? "2.00 pm - 2.30 pm"
                    //             : "2.30 pm - 3.00 pm",
                    );
              }),
            );
          }
          // if (DateFormat("EEE, d-M-y").format(schedule.date) ==
          //     DateFormat("EEE, d-M-y").format(selectedDate)) {
          return const SizedBox();
        },
        // return Container();
        // },
        itemCount: schedules.length,
      ),
    );
  }
}

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