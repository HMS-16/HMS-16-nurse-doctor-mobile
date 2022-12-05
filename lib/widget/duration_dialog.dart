import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';

void durationDialog(BuildContext context, String text) async {
  Future.delayed(const Duration(seconds: 2), () {
    Navigator.pop(context);
  });
  await showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          text,
          textAlign: TextAlign.center,
          style: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        content: Image.asset("assets/images/succes.png"),
      );
    },
  );
  Navigator.pop(context);
}
