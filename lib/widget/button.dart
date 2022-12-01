import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hms_16/style/theme.dart';

class Button extends StatelessWidget {
  final String text;
  final Color? bgcolor;
  final EdgeInsetsGeometry? margin;
  final void Function() onpressed;
  const Button({
    Key? key,
    required this.text,
    this.bgcolor,
    this.margin,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: margin,
      height: 48,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: cPrimaryBase,
            foregroundColor: Colors.white,
          ),
          onPressed: onpressed,
          child: Text(
            text,
          )),
    );
  }
}
