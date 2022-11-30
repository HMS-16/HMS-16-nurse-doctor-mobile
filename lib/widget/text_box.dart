import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';

class TextBox extends StatelessWidget {
  const TextBox({
    Key? key,
    required this.child,
    required this.width,
  }) : super(key: key);

  final String child;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: width,
      height: 43,
      margin: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        color: Color.fromRGBO(236, 236, 236, 1),
      ),
      child: Text(child,
          style: textStyle.copyWith(
              fontSize: 14, fontWeight: FontWeight.w400, color: cBlackBase)),
    );
  }
}
