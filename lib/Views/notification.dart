import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

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
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
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
