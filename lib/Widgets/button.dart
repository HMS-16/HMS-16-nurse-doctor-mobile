import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String text;
  final Color bgcolor;
  final EdgeInsetsGeometry? margin;
  final void Function() onpressed;
  const Button({
    Key? key,
    required this.text,
    required this.bgcolor,
    required this.margin,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: margin,
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgcolor,
            foregroundColor: Colors.white,
            // minimumSize: Size.fromWidth(width)
          ),
          onPressed: onpressed,
          child: Text(
            text,
            style: GoogleFonts.balsamiqSans(fontSize: 14),
          )),
    );
  }
}
