import 'package:flutter/material.dart';
import 'package:hms_16/screens/navbar/message/roomchat.dart';
import 'package:hms_16/screens/notification.dart';
import 'package:hms_16/screens/profile/profile.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/view_model/auth_view_model.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:provider/provider.dart';

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
                        return const Image(
                          image: AssetImage("assets/images/doctor_icon.png"),
                        );
                      } else {
                        return const Image(
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
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
                navPushTransition(context, const RoomChatPage());
              },
              leading: const CircleAvatar(
                maxRadius: 25,
                child: Icon(Icons.person),
              ),
              title: const Text("Nurul Zakiah",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                "Hey, you are free at 01.30 - 02.30 pm today?",
                style: TextStyle(color: cBlack, fontWeight: FontWeight.bold),
              ),
              isThreeLine: true,
              trailing: Column(
                children: [
                  const Text("8:15 am"),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 8, right: 30),
                      child: CircleAvatar(
                        backgroundColor: cPrimaryBase,
                        maxRadius: 12,
                        child: const Text(
                          "1",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
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
