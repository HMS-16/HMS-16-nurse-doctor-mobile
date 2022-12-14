import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:hms_16/screens/navbar/schedule/doctor/view_schedule_bydoctor.dart';
import 'package:hms_16/screens/notification.dart';
import 'package:hms_16/screens/profile/profile_doc.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/widget/navpush_transition.dart';

class HomePageDoctor extends StatefulWidget {
  const HomePageDoctor({super.key});

  @override
  State<HomePageDoctor> createState() => _HomePageDoctorState();
}

class _HomePageDoctorState extends State<HomePageDoctor> {
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
                    navPushTransition(context, const ProfileDoctorPage());
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
            backgroundColor: Color.fromRGBO(110, 169, 250, 1),
            expandedHeight: 220,
            flexibleSpace: const FlexibleSpaceBar(
              background: Image(
                  alignment: Alignment.bottomRight,
                  image: AssetImage("assets/images/Banner.png")),
            ),
          ),
          const SliverToBoxAdapter(
            child: ListTile(
              title: Text("Today's Appointment",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 0.4)),
              subtitle: Text("Thu, Nov 10, 2022"),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return const CardHomepage();
          }, childCount: 7))
        ],
      ),
    );
  }
}

class CardHomepage extends StatelessWidget {
  const CardHomepage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              navPushTransition(context, ViewScheduleDoctor());
            },
            child: Card(
              shadowColor: Color.fromRGBO(111, 111, 111, 0.12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 2,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                      child: CircleAvatar(
                          backgroundColor: cPrimaryBase,
                          child: Icon(
                            Icons.person,
                            color: cWhiteBase,
                          )),
                    ),
                    title: const Text(
                      "Alief Rachman",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    trailing: Badge(
                      elevation: 0,
                      badgeColor: const Color.fromRGBO(227, 236, 250, 1),
                      padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                      shape: BadgeShape.square,
                      borderRadius: BorderRadius.circular(20),
                      toAnimate: false,
                      badgeContent: const Text(
                        "Proccess",
                        style: TextStyle(
                            color: Color.fromRGBO(14, 69, 151, 1),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.fromLTRB(70, 0, 0, 5),
                    child: const Text(
                      "Doctor: Abednego",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.fromLTRB(70, 0, 0, 5),
                    child: const Text(
                      "Nurse: Bella Algama",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.fromLTRB(70, 0, 0, 20),
                    child: Text(
                      "1.30 pm - 2.30 pm",
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 40,
              left: 5,
              child: Container(
                height: 70,
                width: 5,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(0, 97, 228, 1),
                        Color.fromRGBO(192, 219, 255, 1),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)),
              ))
        ],
      ),
    );
  }
}
