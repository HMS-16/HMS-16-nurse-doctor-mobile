import 'package:flutter/material.dart';

class LoadingMax extends StatelessWidget {
  LoadingMax({
    super.key,
    this.color = Colors.white,
  });

  Color color;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(color: color);
  }
}
