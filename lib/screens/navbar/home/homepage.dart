import 'package:flutter/material.dart';
import 'package:hms_16/model/patient_model.dart';
import 'package:hms_16/screens/navbar/schedule/nurse/detail_schedule_bynurse.dart';
import 'package:hms_16/screens/notification.dart';
import 'package:hms_16/screens/profile/profile.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/view_model/patient_view_model.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:hms_16/widget/patientHome_card.dart';
import 'package:hms_16/widget/patientSchedule_card.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteBase,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: "\nDr. Abed",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: cBlack))
                ],
                text: "Welcome!",
                style: TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 14, color: cBlack),
              ),
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
            iconTheme: IconThemeData(color: cBlack),
            floating: true,
            pinned: true,
            backgroundColor: const Color.fromRGBO(110, 169, 250, 1),
            expandedHeight: 220,
            flexibleSpace: const FlexibleSpaceBar(
              background: Image(
                  alignment: Alignment.bottomRight,
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
            delegate: SliverChildBuilderDelegate((context, index) {
              return Consumer<PatientViewModel>(
                  builder: (context, value, child) {
                // return PatientList(persons: patients);
                return PatientListHomeScreen(persons: patients);
              });
            }, childCount: 7),
          ),
        ],
      ),
    );
  }
}

class PatientListHomeScreen extends StatelessWidget {
  final List<PatientModel> persons;

  const PatientListHomeScreen({super.key, required this.persons});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final person = persons.elementAt(index);
        if (DateFormat("EEE, d-M-y").format(person.schedule) ==
            DateFormat("EEE, d-M-y").format(DateTime.now())) {
          return InkWell(
            onTap: () {
              context.read<PatientViewModel>().selectedPerson(person);
              navPushTransition(context, const DetailScheduleNurse());
            },
            child: Builder(builder: (context) {
              Color lineColor = cPrimaryBase;
              Color fontColor = cPrimaryDark;
              Color badgeColor = cSecondaryLighter;
              String condition = 'Process';

              if (person.progress == false) {
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
                patientName: person.name,
                doctorName: person.doctor,
                nurseName: person.nurse,
                time: person.time == 0
                    ? "1.00 pm - 1.30 pm"
                    : person.time == 1
                        ? "1.30 pm - 2.00 pm"
                        : person.time == 2
                            ? "2.00 pm - 2.30 pm"
                            : "2.30 pm - 3.00 pm",
              );
            }),
          );
        }
        return Container();
      },
      itemCount: persons.length,
    );
  }
}
