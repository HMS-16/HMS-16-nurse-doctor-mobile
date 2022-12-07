import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/views/notification.dart';
import 'package:hms_16/views/profile.dart';
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 100,
                    right: 100,
                  ),
                  child: Column(
                    children: [
                      Text("Welcome! Dr. Abed",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24)),
                      Text("Let's do our best for better life.",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ))
                    ],
                  )),
            ),
            backgroundColor: cInfoLight,
            expandedHeight: 220,
            flexibleSpace: const FlexibleSpaceBar(
              background: Image(
                  alignment: Alignment.bottomRight,
                  image: AssetImage("assets/people_home.png")),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navPushTransition(context, const NotificationPage());
                },
                icon: const Icon(Icons.notifications_none),
              ),
              InkWell(
                onTap: () {
                  navPushTransition(context, const ProfilePage());
                },
                child: const CircleAvatar(
                  // backgroundImage: AssetImage("assets/pp.png"),
                  backgroundColor: Colors.transparent,
                  child: Image(image: AssetImage("assets/pp.png")),
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
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
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        )),
                    title: const Text(
                      "Alief Rachman",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    subtitle: const Text("Toothache"),
                    trailing: Badge(
                      badgeColor: const Color.fromRGBO(227, 236, 250, 1),
                      padding: const EdgeInsets.all(10),
                      shape: BadgeShape.square,
                      borderRadius: BorderRadius.circular(10),
                      toAnimate: false,
                      badgeContent: const Text("Proccess"),
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
                    margin: const EdgeInsets.fromLTRB(70, 10, 0, 20),
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
