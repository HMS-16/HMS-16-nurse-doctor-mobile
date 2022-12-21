import 'package:flutter/material.dart';
// import 'package:hms_16/Views/navbar/patient/patient_detail/patient_detail.dart';
// import 'package:hms_16/style/theme.dart';

void dialogValidation(
    {required context,
    VoidCallback? onPressedYes,
    required String title,
    bool isValidation = true,
    bool isImage = true,
    VoidCallback? newPage}) {
  showDialog(
    barrierColor: Color(0xffd9d9d9).withOpacity(.5),
    barrierDismissible: isValidation ? true : false,
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        content: Container(
          width: MediaQuery.of(context).size.width - 85,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              if (isImage) ...[
                Image.asset('assets/images/succes.png', scale: 2.5),
              ],
              if (isValidation) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onPressedYes,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff1153B5),
                            foregroundColor: Colors.white,
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text('Yes'),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: (() => Navigator.pop(context)),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Color(0xff1153B5),
                            backgroundColor: Color(0xffFDFDFD),
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Color(0xff1153B5),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text('No'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              // isValidation
              //     ? Row(
              //         children: [
              //           Expanded(
              //             child: ElevatedButton(
              //               onPressed: onPressedYes,
              //               style: ElevatedButton.styleFrom(
              //                 backgroundColor: Color(0xff1153B5),
              //                 foregroundColor: Colors.white,
              //                 minimumSize: Size(double.infinity, 50),
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(12),
              //                 ),
              //               ),
              //               child: Text('Yes'),
              //             ),
              //           ),
              //           SizedBox(width: 12),
              //           Expanded(
              //             child: ElevatedButton(
              //               onPressed: (() => Navigator.pop(context)),
              //               style: ElevatedButton.styleFrom(
              //                 foregroundColor: Color(0xff1153B5),
              //                 backgroundColor: Color(0xffFDFDFD),
              //                 minimumSize: Size(double.infinity, 50),
              //                 shape: RoundedRectangleBorder(
              //                   side: BorderSide(
              //                     color: Color(0xff1153B5),
              //                   ),
              //                   borderRadius: BorderRadius.circular(12),
              //                 ),
              //               ),
              //               child: Text('No'),
              //             ),
              //           ),
              //         ],
              //       )
              //     : SizedBox(),
            ],
          ),
        ),
      );
    },
  );
  if (!isValidation) {
    newPage!();
    // Future.delayed(Duration(seconds: 2), () {
    //   Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: ((context) => newPage)),
    //     (route) => false,
    //   );
    // });
  }
}

// void durationDialog(BuildContext context, String text) async {
//   Future.delayed(const Duration(seconds: 2), () {
//     Navigator.pop(context);
//   });
//   await showDialog<void>(
//     context: context,
//     barrierDismissible: true,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text(
//           text,
//           textAlign: TextAlign.center,
//           style: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
//         ),
//         content: Image.asset("assets/images/succes.png"),
//       );
//     },
//   );
//   Navigator.pushAndRemoveUntil(
//     context,
//     MaterialPageRoute(builder: ((context) => PatientDetail())),
//     (route) => false,
//   );
// }
