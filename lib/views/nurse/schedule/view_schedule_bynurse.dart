import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hms_16/Views/nurse/schedule/detail_schedule_bynurse.dart';
import 'package:hms_16/style/theme.dart';
import 'package:intl/intl.dart';

class ViewScheduleNurse extends StatefulWidget {
  const ViewScheduleNurse({super.key});

  @override
  State<ViewScheduleNurse> createState() => _ViewScheduleNurseState();
}

DateTime selectedDate = DateTime.now();
DateTime addDate = selectedDate.add(const Duration(days: 1));

class _ViewScheduleNurseState extends State<ViewScheduleNurse> {
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
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          ListTile(
            title: Text("Schedule",
                style: textStyle.copyWith(
                    color: cBlackBase,
                    fontSize: 20,
                    fontWeight: FontWeight.w700)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
                CircleAvatar(
                  backgroundColor: cInfoLightest,
                  child: Text("MK"),
                ),
              ],
            ),
          ),
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
            trailing:
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
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
                      addDate;
                      print(addDate);
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
                      selectedDate.day + 1;
                    });
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                )),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
              )
            ], borderRadius: BorderRadius.circular(15), color: cWhiteBase),
            child: ListTile(
              title: Text(
                "Alief Rachman",
                style: textStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Headache"),
                  Text("Doctor : Abednego"),
                  Text("Nurse : Natasya"),
                  Text("1.30 pm - 2.30 pm"),
                ],
              ),
              leading: CircleAvatar(),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailScheduleNurse(),
                        ));
                  },
                  icon: Icon(Icons.arrow_forward_ios)),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
              )
            ], borderRadius: BorderRadius.circular(15), color: cWhiteBase),
            child: ListTile(
              title: Text(
                "Nurul Zakiah",
                style: textStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Stomach ache"),
                  Text("Doctor : Abednego"),
                  Text("Nurse : Natasya"),
                  Text("1.30 pm - 2.30 pm"),
                ],
              ),
              leading: CircleAvatar(),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailScheduleNurse(),
                        ));
                  },
                  icon: Icon(Icons.arrow_forward_ios)),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
              )
            ], borderRadius: BorderRadius.circular(15), color: cWhiteBase),
            child: ListTile(
              title: Text(
                "Nurul Zakiah",
                style: textStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Stomach ache"),
                  Text("Doctor : Abednego"),
                  Text("Nurse : Natasya"),
                  Text("1.30 pm - 2.30 pm"),
                ],
              ),
              leading: CircleAvatar(),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailScheduleNurse(),
                        ));
                  },
                  icon: Icon(Icons.arrow_forward_ios)),
            ),
          ),
        ],
      ),
    ));
  }
}

// class ChangeDoctorByNurse extends StatelessWidget {
//   const ChangeDoctorByNurse({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ListTile(
//               leading: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(
//                     Icons.arrow_back,
//                     color: cIcon,
//                   )),
//               title: Text("Change Doctor",
//                   style: textStyle.copyWith(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                       color: cBlackBase)),
//             ),
//             const SizedBox(
//               height: 20.0,
//             ),
//             Text(
//               "Today's Schedule (Avaible Doctor)",
//               style: textStyle.copyWith(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(
//               height: 12.0,
//             ),
//             Text(
//               "$selectedDate",
//               style: textStyle.copyWith(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400,
//                   color: cBlackLightest),
//             ),
//             const SizedBox(
//               height: 17.0,
//             ),
//             Container(
//               padding: const EdgeInsets.only(top: 20, bottom: 20),
//               decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 10,
//                     )
//                   ],
//                   borderRadius: BorderRadius.circular(15),
//                   color: cSecondaryLightest),
//               child: ListTile(
//                   onTap: () async {
//                     bool confirm = false;
//                     await showDialog<void>(
//                       context: context,
//                       barrierDismissible: true,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           title: Text(
//                             'Change Doctor to Dr. Nastasya?',
//                             textAlign: TextAlign.center,
//                             style: textStyle.copyWith(
//                                 fontSize: 16, fontWeight: FontWeight.w600),
//                           ),
//                           actions: <Widget>[
//                             ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                   backgroundColor: cPrimaryBase,
//                                   fixedSize: Size.fromWidth(
//                                       MediaQuery.of(context).size.width)),
//                               onPressed: () async {
//                                 await showDialog<void>(
//                                   context: context,
//                                   barrierDismissible: true,
//                                   builder: (BuildContext context) {
//                                     return AlertDialog(
//                                       title: Text(
//                                         'Doctor has been successfully changed!',
//                                         textAlign: TextAlign.center,
//                                         style: textStyle.copyWith(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                       content: Image.asset(
//                                           "assets/images/winner_people_flat_icons.jpeg"),
//                                       actions: <Widget>[
//                                         ElevatedButton(
//                                           style: ElevatedButton.styleFrom(
//                                               backgroundColor: cPrimaryBase,
//                                               fixedSize: Size.fromWidth(
//                                                 MediaQuery.of(context)
//                                                     .size
//                                                     .width,
//                                               )),
//                                           onPressed: () {
//                                             Navigator.pop(context);
//                                           },
//                                           child: const Text("Ok"),
//                                         ),
//                                       ],
//                                     );
//                                   },
//                                 );
//                                 Navigator.pop(context);
//                               },
//                               child: Text(
//                                 "Yes",
//                                 style: textStyle.copyWith(
//                                     fontSize: 14, fontWeight: FontWeight.w600),
//                               ),
//                             ),
//                             OutlinedButton(
//                               style: ButtonStyle(
//                                   fixedSize:
//                                       MaterialStatePropertyAll(Size.fromWidth(
//                                 MediaQuery.of(context).size.width,
//                               ))),
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                               child: Text(
//                                 "No",
//                                 style: textStyle.copyWith(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600,
//                                     color: cBlackBase),
//                               ),
//                             )
//                           ],
//                         );
//                       },
//                     );
//                   },
//                   leading: const SizedBox(
//                       width: 30, height: 30, child: CircleAvatar()),
//                   title: Text(
//                     "Dr. Nastasya",
//                     style: textStyle.copyWith(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         color: cBlackBase),
//                   ),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Clinical Specialist Doctor",
//                         style: textStyle.copyWith(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 12,
//                             color: cBlackLightest),
//                       ),
//                       const SizedBox(
//                         height: 20.0,
//                       ),
//                       Text(
//                         "1.30 pm - 2.30 pm",
//                         style: textStyle.copyWith(
//                             color: cBlackLightest,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 12),
//                       )
//                     ],
//                   ),
//                   trailing: Icon(
//                     Icons.message,
//                     color: cInfoLight,
//                   )),
//             ),
//             const SizedBox(
//               height: 12.0,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }