import 'package:flutter/material.dart';
import 'package:hms_16/model/patient_model.dart';
import 'package:hms_16/model/schedule_model.dart';
import 'package:hms_16/screens/navbar/schedule/detail_schedule.dart';
import 'package:hms_16/screens/notification.dart';
import 'package:hms_16/screens/profile/profile.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/view_model/auth_view_model.dart';
import 'package:hms_16/view_model/patient_view_model.dart';
import 'package:hms_16/view_model/schedule_view_model.dart';
import 'package:hms_16/widget/dialog_validation.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:hms_16/widget/patientHome_card.dart';
import 'package:hms_16/widget/status/loading_max.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // final id = context.read<AuthViewModel>().idUser;
    final profileViewModel = context.read<AuthViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (profileViewModel.profile == null) {
        await profileViewModel.getProfile();
      }
      context.read<PatientViewModel>().getAllPatient(context);
      context
          .read<ScheduleViewModel>()
          .getAllSchedule(DateFormat('M/d/y').format(DateTime.now()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteBase,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Consumer<AuthViewModel>(
              builder: (context, value, child) {
                switch (value.authState) {
                  // case ActionState.error:
                  //   return Center(child: Text('error'),);
                  case ActionState.loading:
                    // Future.delayed(Duration(seconds: 2));
                    print('lagi loading (homepage)');
                    return LoadingMax(color: cBlackLight);
                  case ActionState.none:
                    final username = value.profile!.name;
                    final call;
                    if (value.profile!.role == 1) {
                      call = "Dr.";
                    } else {
                      call = "Mrs.";
                    }
                    return RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "\n $call ${username}",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: cBlack,
                            ),
                          ),
                        ],
                        text: "Welcome!",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: cBlack,
                        ),
                      ),
                    );
                }
              },
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
                              image:
                                  AssetImage("assets/images/doctor_icon.png"),
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
            iconTheme: IconThemeData(color: cBlack),
            // floating: true,
            pinned: true,
            backgroundColor: const Color.fromRGBO(110, 169, 250, 1),
            expandedHeight: 220,
            flexibleSpace: const FlexibleSpaceBar(
              background: Image(
                  // alignment: Alignment.bottomRight,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/Banner.png")),
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              title: const Text("Today's Appointment",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 0.4)),
              subtitle: Text(DateFormat("EEE, MMM d, yyyy")
                  .format(DateTime.now())
                  .toString()),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Consumer<ScheduleViewModel>(
                    builder: (context, value, child) {
                  // return PatientList(persons: patients);
                  return PatientListHomeScreen(
                    schedules: context.read<ScheduleViewModel>().schedules,
                    // patients: context.read<PatientViewModel>().persons,
                  );
                });
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}

class PatientListHomeScreen extends StatelessWidget {
  final List<DataSchedule> schedules;
  // final List<DataPatient> patients;

  const PatientListHomeScreen({
    super.key,
    required this.schedules,
    // required this.patients,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PatientViewModel>(
      builder: (context, value, child) {
        switch (value.patientState) {
          case ActionState.loading:
            return Center(child: LoadingMax(color: cPrimaryLight));
          case ActionState.none:
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final schedule = schedules.elementAt(index);
                // final patient = patients.elementAt(index);
                // if (DateFormat("EEE, d-M-y").format(schedule.date) ==
                //     DateFormat("EEE, d-M-y").format(DateTime.now())) {
                return InkWell(
                  onTap: () {
                    context
                        .read<ScheduleViewModel>()
                        .selectedSchedule(schedule);
                    navPushTransition(context, const DetailSchedule());
                  },
                  child: Builder(builder: (context) {
                    Color lineColor = cPrimaryBase;
                    Color fontColor = cPrimaryDark;
                    Color badgeColor = cSecondaryLighter;
                    String condition = 'Process';

                    if (schedule.status != false) {
                      lineColor = cGreenLine;
                      condition = 'Done';
                      badgeColor = cSuccessLightest;
                      fontColor = cSuccessDark;
                    }
                    return PatientHomeCard(
                      fontColor: fontColor,
                      lineColor: lineColor,
                      paintBadge: badgeColor,
                      badgeText: condition,
                      patientName: schedule.name,
                      doctorName: schedule.doctor,
                      nurseName: schedule.nurse,
                      // time: person.time == 0
                      //     ? "1.00 pm - 1.30 pm"
                      //     : person.time == 1
                      //         ? "1.30 pm - 2.00 pm"
                      //         : person.time == 2
                      //             ? "2.00 pm - 2.30 pm"
                      //             : "2.30 pm - 3.00 pm",
                    );
                  }),
                );
                // }
                // return SizedBox();
              },
              itemCount: schedules.length,
            );
        }
      },
    );
  }
}
