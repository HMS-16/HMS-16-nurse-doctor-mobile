import 'package:flutter/material.dart';
import 'package:hms_16/utils/constant.dart';

class ListTileProfile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? trailing;
  const ListTileProfile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 2, color: cWhiteDarker))),
      child: ListTile(
        trailing: trailing,
        title: Text(
          title,
          style: TextStyle(color: cBlackLightest),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 16, color: cBlack),
        ),
      ),
    );
  }
}