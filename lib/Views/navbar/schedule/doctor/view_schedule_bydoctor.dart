import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/views/navbar/schedule/doctor/detail_schedule_bydoctor.dart';
import 'package:hms_16/views/navbar/schedule/nurse/view_schedule_bynurse.dart';
import 'package:hms_16/widget/patientSchedule_card.dart';
import 'package:intl/intl.dart';

class ViewScheduleDoctor extends StatefulWidget {
  const ViewScheduleDoctor({super.key});

  @override
  State<ViewScheduleDoctor> createState() => _ViewScheduleDoctorState();
}

DateTime selectedDate = DateTime.now();
DateTime prevDate =
    DateTime(selectedDate.year, selectedDate.month, selectedDate.day - 1);
DateTime nextDate =
    DateTime(selectedDate.year, selectedDate.month, selectedDate.day + 1);

class _ViewScheduleDoctorState extends State<ViewScheduleDoctor> {
  @override
  Widget build(BuildContext context) {
    pickDate() async {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (pickedDate != null && pickedDate != selectedDate) {
        setState(() {
          selectedDate = pickedDate;
        });
      }
    }

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: cBlack),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Schedule - doctor',
            style: textStyle.copyWith(
                fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ViewScheduleNurse(),
                      ));
                },
                icon: Icon(
                  Icons.notifications,
                  color: cIcon,
                )),
            CircleAvatar(
              backgroundColor: cInfoLightest,
              child: Text("MK"),
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ListTile(
                title: Row(
                  children: [
                    const SizedBox(
                      width: 8.0,
                    ),
                    TextButton(
                      onPressed: () {
                        pickDate();
                      },
                      child: Text(
                        DateFormat.MMMM().format(selectedDate),
                        style: textStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: cBlackBase),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_drop_down_outlined)),
                  ],
                ),
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search)),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  )
                ], borderRadius: BorderRadius.circular(12), color: cWhiteBase),
                child: ListTile(
                    leading: IconButton(
                        onPressed: () {
                          setState(() {
                            // addDate;
                            prevDate;
                          });
                          // final dateChanged = selectedDate.day - 1;
                          print(prevDate);
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    title: TextButton(
                      onPressed: () {
                        pickDate();
                      },
                      child: Text(
                        DateFormat("EEE, d-M-y").format(selectedDate),
                        textAlign: TextAlign.center,
                        style: textStyle.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: cBlackBase),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          nextDate;
                          print(nextDate);
                        });
                      },
                      icon: const Icon(Icons.arrow_forward_ios),
                    )),
              ),
              const SizedBox(
                height: 24.0,
              ),
              PatientScheduleCard(
                disease: "Headache",
                doctorName: "Abednego",
                icon: CircleAvatar(),
                patientName: "Alief Rachman",
                nurseName: "Nastasya",
                time: "1.30 pm - 2.30 pm",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailScheduleDoctor()));
                },
              ),
              PatientScheduleCard(
                disease: "Stomatch ache",
                doctorName: "Abednego",
                icon: CircleAvatar(),
                patientName: "Nurul Zakiah",
                nurseName: "Nastasya",
                time: "1.30 pm - 2.30 pm",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailScheduleDoctor(),
                      ));
                },
              ),
              PatientScheduleCard(
                disease: "Stomatch ache",
                doctorName: "Abednego",
                icon: CircleAvatar(),
                patientName: "Nurul Zakiah",
                nurseName: "Nastasya",
                time: "1.30 pm - 2.30 pm",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailScheduleDoctor(),
                      ));
                },
              ),
            ],
          ),
        ));
  }
}
