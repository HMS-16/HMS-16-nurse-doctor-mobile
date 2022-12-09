import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/views/navbar/schedule/nurse/view_schedule_bynurse.dart';
import 'package:hms_16/widget/duration_dialog.dart';
import 'package:intl/intl.dart';

class ChangeScheduleByNurse extends StatefulWidget {
  const ChangeScheduleByNurse({super.key});

  @override
  State<ChangeScheduleByNurse> createState() => _ChangeScheduleByNurseState();
}

List<String> itemsSchedule = [
  "1.30 pm - 2.30 pm",
  "2.45 pm - 3.45 pm",
  "6.00 pm - 7.00 pm",
  "7.20 pm - 8.20 pm"
];
String valueDropdown = itemsSchedule.first;

class _ChangeScheduleByNurseState extends State<ChangeScheduleByNurse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: cBlack),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Schedule Available',
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
              DateFormat('EEEE, MMMM d').format(selectedDate),
              style: textStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: cBlackBase,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Specialist Nurse",
              style:
                  textStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 12),
            ),
            SizedBox(
              height: 43,
              child: TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 12, left: 12),
                    filled: true,
                    fillColor: cWhiteDarker,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12)),
                    hintText: "Clinical Specialist",
                    hintStyle: textStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400)),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Status",
              style:
                  textStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 12),
            ),
            SizedBox(
              height: 43,
              child: TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 12, left: 12),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12)),
                    fillColor: cWhiteDarker,
                    hintText: "Available",
                    hintStyle: textStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400)),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Hours Available",
              style:
                  textStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 12),
            ),
            DropdownButtonFormField<String>(
              // dropdownColor: Colors.red,
              decoration: InputDecoration(
                  fillColor: cSecondaryLightest,
                  filled: true,
                  enabledBorder:
                      const UnderlineInputBorder(borderSide: BorderSide.none)),
              isExpanded: true,
              value: valueDropdown,
              elevation: 0,
              borderRadius: BorderRadius.circular(12),
              style:
                  textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
              onChanged: (value) {
                setState(() {
                  valueDropdown = value!;
                });
              },
              items: itemsSchedule
                  .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e,
                          style: textStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: cBlackLighter)),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 51,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: cPrimaryBase,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () async {
                  await showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        actionsPadding: const EdgeInsets.only(
                            bottom: 32, right: 20, left: 20),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        content: SingleChildScrollView(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: const [
                                  SizedBox(
                                    height: 3.0,
                                  ),
                                  SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: CircleAvatar()),
                                ],
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Schedule Available",
                                      style: textStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: cBlack),
                                    ),
                                    Text(
                                      DateFormat('EEEE, MMMM d')
                                          .format(selectedDate),
                                      style: textStyle.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: cBlackLightest),
                                    ),
                                    Text(
                                      valueDropdown,
                                      style: textStyle.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: cBlackLightest),
                                    ),
                                    Text(
                                      "Are you sure you want to change your schedule?",
                                      style: textStyle.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: cBlackLightest),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          Row(
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
                                          "Schedule has been successfully changed!");
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
                                              width: 1, color: cPrimaryBase),
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
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  "Save",
                  style: textStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
