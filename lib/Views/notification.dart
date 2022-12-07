import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/widget/duration_dialog.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: cBlack),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Notifications',
          style: textStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
        ),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/succes.png"),
                      )),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    title: Text("Are you sure to clear all notifications?"),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  backgroundColor: cPrimaryBase,
                                  minimumSize: Size(130, 50)),
                              onPressed: () {
                                Navigator.pop(context);
                                durationDialog(
                                    context, "Notifications has been cleared!");
                              },
                              child: Text("Yes")),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide(color: cPrimaryBase),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  backgroundColor: Colors.white,
                                  minimumSize: Size(130, 50)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "No",
                                style: TextStyle(color: Colors.black),
                              )),
                        ],
                      ),
                    ],
                  ),
                );
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text("Clear all"),
              )
            ],
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text("Today"),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 8,
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: CircleAvatar(
                          maxRadius: 10,
                          backgroundColor: Colors.grey.shade700,
                        ),
                      ),
                      title: const Text(
                        "Reminder! You have schedule at 10.00 - 11.00 am",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 8,
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: CircleAvatar(
                          maxRadius: 10,
                          backgroundColor: Colors.grey.shade700,
                        ),
                      ),
                      title: const Text(
                        "Reminder! You have schedule at 10.00 - 11.00 am",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
