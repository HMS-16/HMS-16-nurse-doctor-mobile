import 'package:flutter/material.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/widget/duration_dialog.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

List notifdata = [
  "You have new schedule to replace Dr. Bednego at 01.00-01.30 today!",
  "Reminder! You have schedule at 10.00 - 11.00 am",
  "Reminder! You have schedule at 10.00 - 11.00 am",
  "You have new schedule to replace Dr. Bednego at 01.00-01.30 today!"
];

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteBase,
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
              setState(() async {
                await showDialog<void>(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/succes.png"),
                      )),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    title:
                        const Text("Are you sure to clear all notifications?"),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  backgroundColor: cPrimaryBase,
                                  minimumSize: const Size(130, 50)),
                              onPressed: () async {
                                durationDialog(
                                    context, "Notifications has been cleared!");
                                Future.delayed(const Duration(seconds: 2), () {
                                  Navigator.pop(context);
                                });
                                setState(() {
                                  notifdata.removeRange(0, notifdata.length);
                                });
                              },
                              child: const Text("Yes")),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide(color: cPrimaryBase),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  backgroundColor: Colors.white,
                                  minimumSize: const Size(130, 50)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
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
              const PopupMenuItem(
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
          if (notifdata.isNotEmpty) ...[
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text("Today"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notifdata.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shadowColor: const Color.fromRGBO(111, 111, 111, 0.12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: CircleAvatar(
                            maxRadius: 10,
                            backgroundColor: Colors.grey.shade700,
                          ),
                        ),
                        title: Text(
                          notifdata[index],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ] else ...[
            Center(
              child: Column(
                children: [
                  const Image(image: AssetImage("assets/images/no_data.png")),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("You don't have any notification yet.")
                ],
              ),
            )
          ],
        ],
      ),
    );
  }
}
