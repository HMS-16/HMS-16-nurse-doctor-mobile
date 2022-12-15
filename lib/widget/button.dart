import 'package:flutter/material.dart';
import 'package:hms_16/utils/constant.dart';

class Button extends StatelessWidget {
  final Widget child;
  final Color? bgcolor;
  final EdgeInsetsGeometry? margin;
  final void Function() onpressed;
  const Button({
    Key? key,
    required this.child,
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
        child: child,
      ),
    );
  }
}
