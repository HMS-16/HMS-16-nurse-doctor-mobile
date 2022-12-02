import 'package:flutter/material.dart';
import 'package:hms_16/Views/notification.dart';
import 'package:hms_16/Views/profile.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/views/navbar/patient/patient_detail/patient_detail.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:hms_16/widget/patient_card.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: cBlack),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Patient',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            SizedBox(
              width: double.infinity,
              height: 48,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  label: Text('Search'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            PatientList(),
          ],
        ),
      ),
    );
  }
}

class PatientList extends StatelessWidget {
  const PatientList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              navPushTransition(context, const PatientDetail());
              // Navigator.push(
              //   context,
              //   PageRouteBuilder(
              //     transitionsBuilder:
              //         (context, animation, secondaryAnimation, child) {
              //       return SlideTransition(
              //         position: animation.drive(
              //           Tween(begin: const Offset(1.0, 0.0), end: Offset.zero),
              //         ),
              //         child: child,
              //       );
              //     },
              //     pageBuilder: (context, animation, secondaryAnimation) {
              //       return const PatientDetail();
              //     },
              //   ),
              // );
            },
            child: const PatientCard(),
          );
        },
        itemCount: 15,
        separatorBuilder: (context, index) => const SizedBox(height: 20),
      ),
    );
  }
}
