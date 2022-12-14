import 'package:flutter/material.dart';
import 'package:hms_16/model/change_doctor_model.dart';
import 'package:hms_16/screens/navbar/schedule/view_schedule.dart';
import 'package:hms_16/view_model/doctor_view_model.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/view_model/schedule_view_model.dart';
import 'package:hms_16/widget/duration_dialog.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChangeDoctor extends StatefulWidget {
  const ChangeDoctor({super.key});

  @override
  State<ChangeDoctor> createState() => _ChangeDoctorState();
}

class _ChangeDoctorState extends State<ChangeDoctor> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scheduleProvider =
        Provider.of<ScheduleViewModel>(context, listen: false);
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
          Consumer<DoctorViewModel>(
            builder: (context, value, child) {
              return Expanded(
                  child: ListView.builder(
                      itemCount: value.getlistDoctor.length,
                      itemBuilder: (context, index) {
                        final dataProvider = value.getlistDoctor[index];
                        if (dataProvider.role == 1) {
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    title: Text(
                                      'Change Doctor to ${dataProvider.name}?',
                                      textAlign: TextAlign.center,
                                      style: textStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
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
                                                        BorderRadius.circular(
                                                            12)),
                                                backgroundColor: cPrimaryBase,
                                              ),
                                              onPressed: () {
                                                print(dataProvider.strNum);
                                                print(scheduleProvider
                                                    .schedule!.id);
                                                scheduleProvider.changeDoctor(
                                                    ChangeDoctorModel(
                                                        doctorId: dataProvider
                                                            .strNum),
                                                    scheduleProvider
                                                        .schedule!.id);
                                                context
                                                    .read<ScheduleViewModel>()
                                                    .getAllSchedule();
                                                durationDialog(context,
                                                    "Doctor has been successfully changed!");
                                                Future.delayed(
                                                    const Duration(seconds: 2),
                                                    () {
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                });
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
                                                        BorderRadius.circular(
                                                            12)),
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
                              margin: const EdgeInsets.only(
                                  top: 17, left: 16, right: 16),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: CircleAvatar(),
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
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: cBlack)),
                                                  Text(
                                                    "Doctor Umum",
                                                    style: textStyle.copyWith(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: cBlackLightest,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        Future.delayed(
                                            const Duration(seconds: 2), () {
                                          Navigator.pop(context);
                                        });
                                        await showDialog<void>(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15))),
                                              title: Text(
                                                "Coming soon!",
                                                textAlign: TextAlign.center,
                                                style: textStyle.copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        Icons.message,
                                        color: cInfoLight,
                                      ))
                                ],
                              ),
                            ),
                          );
                        }
                        return const SizedBox();
                      }));
            },
          )
        ],
      ),
    );
  }
}
