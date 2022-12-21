import 'package:flutter/material.dart';
import 'package:hms_16/model/schedule_model.dart';
import 'package:hms_16/screens/navbar/schedule/detail_schedule.dart';
import 'package:hms_16/screens/notification.dart';
import 'package:hms_16/screens/profile/profile.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/view_model/auth_view_model.dart';
import 'package:hms_16/view_model/doctor_view_model.dart';
import 'package:hms_16/view_model/schedule_view_model.dart';
import 'package:hms_16/widget/dialog_validation.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:hms_16/widget/patientSchedule_card.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ViewSchedule extends StatefulWidget {
  const ViewSchedule({super.key});

  @override
  State<ViewSchedule> createState() => _ViewScheduleState();
}

DateTime selectedDate = DateTime.now();

class _ViewScheduleState extends State<ViewSchedule> {
  @override
  void initState() {
    context
        .read<ScheduleViewModel>()
        .getAllSchedule(DateFormat('M/d/y').format(selectedDate));
    context.read<DoctorViewModel>().getAllDoctor();
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
              navPushTransition(context, const NotificationPage());
            },
            icon: Icon(
              Icons.notifications,
              color: cPrimaryBase,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {
                navPushTransition(context, ProfilePage());
              },
              icon: Consumer<AuthViewModel>(
                builder: (context, value, child) {
                  return CircleAvatar(
                    backgroundColor: cPrimaryBase,
                    minRadius: 40,
                    child: LayoutBuilder(builder: (context, constraints) {
                      if (value.profile!.role == 1) {
                        return Image(
                          image: AssetImage("assets/images/doctor_icon.png"),
                        );
                      } else {
                        return Image(
                          image: AssetImage("assets/images/nurse_icon.png"),
                        );
                      }
                    }),
                  );
                },
              ),
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
          if (schedules.isNotEmpty) {
            return InkWell(
              onTap: () {
                context.read<ScheduleViewModel>().selectedSchedule(schedule);
                navPushTransition(context, const DetailSchedule());
              },
              child: Builder(builder: (context) {
                Color lineColor = cPrimaryBase;
                Color fontColor = cPrimaryDark;
                Color badgeColor = cSecondaryLighter;
                return PatientScheduleCard(
                    fontColor: fontColor,
                    lineColor: lineColor,
                    patientName: schedule.name,
                    doctorName: schedule.doctor,
                    nurseName: schedule.nurse,
                    time: schedule.shift
                    );
              }),
            );
          }
          return const SizedBox();
        },
        // return Container();
        // },
        itemCount: schedules.length,
      ),
    );
  }
}
