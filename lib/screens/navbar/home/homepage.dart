import 'package:flutter/material.dart';
import 'package:hms_16/model/schedule_model.dart';
import 'package:hms_16/screens/navbar/schedule/detail_schedule.dart';
import 'package:hms_16/screens/notification.dart';
import 'package:hms_16/screens/profile/profile.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/view_model/auth_view_model.dart';
import 'package:hms_16/view_model/patient_view_model.dart';
import 'package:hms_16/view_model/schedule_view_model.dart';
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
  // initial() async {
  // }

  // getprofile() async {}

  @override
  void initState() {
    // WidgetsBinding.instance.
    print("init jadi");
    Future(() async {
      context.read<ScheduleViewModel>().getAllSchedule();
      // getprofile();
      final profileViewModel = context.read<AuthViewModel>();
      if (profileViewModel.profile == null) {
        await profileViewModel.getProfile();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build jadi");
    return Scaffold(
      backgroundColor: cWhiteBase,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Consumer<AuthViewModel>(
              builder: (context, value, child) {
                switch (value.authState) {
                  case ActionState.loading:
                    return LoadingMax(color: cBlackLight);
                  case ActionState.none:
                    final username = value.profile!.name;
                    // final call;
                    // if (value.profile!.role == 1) {
                    //   call = "Dr.";
                    // }
                    return RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: value.profile!.role == 1
                                ? "\n Dr. $username"
                                : "\n $username",
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
                        child: value.profile?.role == 1
                            ? Image(
                                image:
                                    AssetImage("assets/images/doctor_icon.png"),
                              )
                            : value.profile?.role == 2
                                ? Image(
                                    image: AssetImage(
                                        "assets/images/nurse_icon.png"),
                                  )
                                : SizedBox.shrink(),
                        // LayoutBuilder(builder: (context, constraints) {
                        //   if (value.profile!.role == 1) {
                        //     return Image(
                        //       image:
                        //           AssetImage("assets/images/doctor_icon.png"),
                        //     );
                        //   } else {
                        //     return Image(
                        //       image: AssetImage("assets/images/nurse_icon.png"),
                        //     );
                        //   }
                        // }),
                      );
                    },
                  ),
                ),
              ),
            ],
            iconTheme: IconThemeData(color: cBlack),
            pinned: true,
            backgroundColor: const Color.fromRGBO(110, 169, 250, 1),
            expandedHeight: 220,
            flexibleSpace: const FlexibleSpaceBar(
              background: Image(
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
                    switch (value.scheduleState) {
                      case ActionState.loading:
                        return Center(child: LoadingMax(color: cPrimaryLight));
                      case ActionState.none:
                        return PatientListHomeScreen(
                          schedules:
                              context.read<ScheduleViewModel>().schedules,
                        );
                    }
                  },
                );
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

  const PatientListHomeScreen({
    super.key,
    required this.schedules,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final nameUser = context.read<AuthViewModel>().profile?.name;
        final schedule = schedules.elementAt(index);
        final getDate = DateFormat('M/d/y').parse(schedule.date);
        final schedulePatient = DateFormat('y-M-d').format(getDate);
        final dateNow = DateFormat('y-M-d').format(DateTime.now());
        // print(schedule.doctor);
        if ((schedulePatient == dateNow) &&
            (nameUser == schedule.doctor || nameUser == schedule.nurse)) {
          return InkWell(
            onTap: () {
              context.read<ScheduleViewModel>().selectedSchedule(schedule);
              navPushTransition(context, const DetailSchedule());
            },
            child: Builder(
              builder: (context) {
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
                );
              },
            ),
          );
        }
        return SizedBox.shrink();
      },
      itemCount: schedules.length,
    );
  }
  //     },
  //   );
  // }
}
