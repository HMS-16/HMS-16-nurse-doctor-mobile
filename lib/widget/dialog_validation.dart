import 'package:flutter/material.dart';

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
            ],
          ),
        ),
      );
    },
  );
  if (!isValidation) {
    newPage!();
  }
}
