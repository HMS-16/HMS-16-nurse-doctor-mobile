import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/views/navbar/patient/patient_detail/patient_detail.dart';

class DetailScheduleDoctor extends StatelessWidget {
  const DetailScheduleDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: cBlack),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Schedule Detail',
          style: textStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    )
                  ],
                  borderRadius: BorderRadius.circular(24),
                  color: cSecondaryLightest),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Patient",
                      style: textStyle.copyWith(
                          color: cBlackBase,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Alief Rachman",
                      style: textStyle.copyWith(
                          color: cBlackBase,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      "Register Date : Sep 16, 2022",
                      style: textStyle.copyWith(
                          color: cBlackBase,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Last Appointment : Sep 23, 2022",
                      style: textStyle.copyWith(
                          color: cBlackBase,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Next Appointment : Sep 30, 2022",
                      style: textStyle.copyWith(
                          color: cBlackBase,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "View Patient Detail",
                      style: textStyle.copyWith(
                          color: cPrimaryBase,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PatientDetail(),
                            ));
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        color: cIcon,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: cWhiteDarker),
              child: ListTile(
                title: Text(
                  "Note",
                  style: textStyle.copyWith(
                      color: cBlackBase,
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Experiencing symptoms :",
                      style: textStyle.copyWith(
                          color: cBlackBase,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    Text(
                      "- Red on the throat",
                      style: textStyle.copyWith(
                          color: cBlackBase,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    Text(
                      "- The salivary glands are enlarged",
                      style: textStyle.copyWith(
                          color: cBlackBase,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    Text(
                      "- Mild respiratory distress",
                      style: textStyle.copyWith(
                          color: cBlackBase,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                )
              ], borderRadius: BorderRadius.circular(12), color: cWhiteBase),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Doctor",
                    style: textStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: cBlackLightest),
                  ),
                  ListTile(
                    leading: const SizedBox(
                        width: 53, height: 53, child: CircleAvatar()),
                    title: Text(
                      "Abednego",
                      style: textStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: cBlackBase),
                    ),
                    // trailing: TextButton(
                    //   onPressed: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => const ChangeDoctorByNurse(),
                    //         ));
                    //   },
                    //   child: Text(
                    //     "Change",
                    //     style: textStyle.copyWith(
                    //         fontSize: 12,
                    //         fontWeight: FontWeight.w700,
                    //         color: cPrimaryBase),
                    //   ),
                    // ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                )
              ], borderRadius: BorderRadius.circular(12), color: cWhiteBase),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nurse",
                    style: textStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: cBlackLightest),
                  ),
                  ListTile(
                    leading: const SizedBox(
                        width: 53, height: 53, child: CircleAvatar()),
                    title: Text(
                      "Natasya",
                      style: textStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: cBlackBase),
                    ),
                    // trailing: TextButton(
                    //   onPressed: () {},
                    //   child: Text(
                    //     "Change",
                    //     style: textStyle.copyWith(
                    //         fontSize: 12,
                    //         fontWeight: FontWeight.w700,
                    //         color: cPrimaryBase),
                    //   ),
                    // ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                )
              ], borderRadius: BorderRadius.circular(12), color: cWhiteBase),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Schedule",
                    style: textStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: cBlackLightest),
                  ),
                  ListTile(
                    title: Text(
                      "1.30 - 2.30 pm",
                      style: textStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: cBlackBase),
                    ),
                    // trailing: TextButton(
                    //   onPressed: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) =>
                    //               const ChangeScheduleByNurse(),
                    //         ));
                    //   },
                    //   child: Text(
                    //     "Change",
                    //     style: textStyle.copyWith(
                    //         fontSize: 12,
                    //         fontWeight: FontWeight.w700,
                    //         color: cPrimaryBase),
                    //   ),
                    // ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
