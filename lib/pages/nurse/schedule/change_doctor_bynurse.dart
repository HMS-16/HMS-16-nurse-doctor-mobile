import 'package:flutter/material.dart';
import 'package:hms_16/pages/nurse/schedule/view_schedule_bynurse.dart';
import 'package:hms_16/style/theme.dart';
import 'package:intl/intl.dart';

class ChangeDoctorByNurse extends StatelessWidget {
  const ChangeDoctorByNurse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: cBlack),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Change Doctor',
          style: textStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today's Schedule (Avaible Doctor)",
              style: textStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              DateFormat('EEE, d MMM y').format(selectedDate),
              style: textStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: cBlackLightest),
            ),
            const SizedBox(
              height: 17.0,
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: cSecondaryLightest),
              child: ListTile(
                  onTap: () async {
                    await showDialog<void>(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Change Doctor to Dr. Nastasya?',
                            textAlign: TextAlign.center,
                            style: textStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 120,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: cPrimaryBase,
                                    ),
                                    onPressed: () async {
                                      await showDialog<void>(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                              'Doctor has been successfully changed!',
                                              textAlign: TextAlign.center,
                                              style: textStyle.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            content: Image.asset(
                                                "assets/images/winner_people_flat_icons.jpeg"),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        cPrimaryBase,
                                                    fixedSize: Size.fromWidth(
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width,
                                                    )),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("Ok"),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Yes",
                                      style: textStyle.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "No",
                                      style: textStyle.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: cBlackBase),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    );
                  },
                  leading: const SizedBox(
                      width: 30, height: 30, child: CircleAvatar()),
                  title: Text(
                    "Dr. Nastasya",
                    style: textStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: cBlackBase),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Clinical Specialist Doctor",
                        style: textStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: cBlackLightest),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "1.30 pm - 2.30 pm",
                        style: textStyle.copyWith(
                            color: cBlackLightest,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      )
                    ],
                  ),
                  trailing: Icon(
                    Icons.message,
                    color: cInfoLight,
                  )),
            ),
            const SizedBox(
              height: 12.0,
            ),
          ],
        ),
      ),
    );
  }
}
