import 'package:flutter/material.dart';
import 'package:hms_16/Views/navbar/schedule/nurse/change_schedule_bynurse.dart';
import 'package:hms_16/models/doctor_view_model.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/views/navbar/schedule/nurse/view_schedule_bynurse.dart';
import 'package:hms_16/widget/duration_dialog.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChangeDoctorByNurse extends StatefulWidget {
  const ChangeDoctorByNurse({super.key});

  @override
  State<ChangeDoctorByNurse> createState() => _ChangeDoctorByNurseState();
}

class _ChangeDoctorByNurseState extends State<ChangeDoctorByNurse> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DoctorViewModel>(context, listen: false);
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
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
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          provider.listDoctors.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                  itemCount: provider.listDoctors.length,
                  itemBuilder: (context, index) {
                    final dataProvider = provider.listDoctors[index];
                    return GestureDetector(
                      onTap: () async {
                        await showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 32, horizontal: 12),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              title: Text(
                                'Change Doctor to ${dataProvider.name}?',
                                textAlign: TextAlign.center,
                                style: textStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          backgroundColor: cPrimaryBase,
                                        ),
                                        onPressed: () async {
                                          durationDialog(context,
                                              "Doctor has been successfully changed!");
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
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1,
                                                  color: cPrimaryBase),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          backgroundColor: cWhiteBase,
                                        ),
                                        onPressed: () async {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "No",
                                          style: textStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: cPrimaryBase),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 17, left: 16, right: 16),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 17, vertical: 20),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                              )
                            ],
                            borderRadius: BorderRadius.circular(15),
                            color: cWhiteBase),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              dataProvider.urlProfile),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(dataProvider.name,
                                                style: textStyle.copyWith(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: cBlack)),
                                            Text(dataProvider.specialist,
                                                style: textStyle.copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: cBlackLightest)),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            Text(
                                                dataProvider.startTime == 1
                                                    ? "1.00 pm - 1.30 pm"
                                                    : dataProvider.startTime ==
                                                            2
                                                        ? "1.30 pm - 2.00 pm"
                                                        : dataProvider
                                                                    .startTime ==
                                                                3
                                                            ? "2.00 pm - 2.30 pm"
                                                            : "2.30 pm - 3.00 pm",
                                                style: textStyle.copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: cBlackLightest)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.message,
                                  color: cInfoLight,
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                )),
        ],
      ),
    );
  }
}