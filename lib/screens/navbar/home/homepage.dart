import 'package:flutter/material.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/screens/navbar/schedule/nurse/change_schedule_bynurse.dart';
import 'package:hms_16/screens/notification.dart';
import 'package:hms_16/screens/profile.dart';
import 'package:hms_16/widget/home_card.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: cBlack),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Dr. Abed!',
              style: textStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
            ),
            Text(
              "Let's check your schedule today",
              style: textStyle.copyWith(color: Colors.black, fontSize: 13),
            ),
          ],
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
              navPushTransition(context, const ProfilePage());
            },
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Tile(
                title: Text("Today's Appointment",
                    style: textStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: cBlack)),
                subtitle: Text(
                    DateFormat("EEE, MMM d, yyyy").format(DateTime.now()))),
            HomeCard(
              disease: "Headache",
              doctorName: "Abednego",
              patientName: "Alief Rachman",
              nurseName: "Nastasya",
              time: "$valueDropdown",
            ),
            HomeCard(
              disease: "Headache",
              doctorName: "Nurul Zakiah",
              patientName: "Alief Rachman",
              nurseName: "Nastasya",
              time: "$valueDropdown",
            ),
          ],
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final Widget? leading;
  const Tile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      leading: leading,
    );
  }
}
