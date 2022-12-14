import 'package:flutter/material.dart';
import 'package:hms_16/screens/navbar/message/roomchat.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/screens/notification.dart';
import 'package:hms_16/screens/profile/profile_doc.dart';
import 'package:hms_16/widget/navpush_transition.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: cBlack),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Messages',
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
              navPushTransition(context, const ProfileDoctorPage());
            },
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
            ListTile(
              onTap: () {
                navPushTransition(context, RoomChatPage());
              },
              leading: CircleAvatar(
                maxRadius: 25,
                child: Icon(Icons.person),
              ),
              title: Text("Nurul Zakiah",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                "Hey, you are free at 01.30 - 02.30 pm today?",
                style: TextStyle(color: cBlack, fontWeight: FontWeight.bold),
              ),
              isThreeLine: true,
              trailing: Column(
                children: [
                  Text("8:15 am"),
                  Container(
                    margin: EdgeInsets.only(top: 8, right: 30),
                    child: CircleAvatar(
                      backgroundColor: cPrimaryBase,
                      child: Text(
                        "1",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                      maxRadius: 12,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
