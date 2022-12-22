import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:hms_16/utils/constant.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({
    super.key,
    required this.patientName,
    required this.lineColor,
    required this.badgeText,
    required this.paintBadge,
    required this.fontColor,
  });

  final String patientName;

  final String badgeText;
  final Color lineColor;
  final Color paintBadge;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        color: const Color.fromRGBO(253, 253, 253, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 3.5,
            height: 41,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  lineColor,
                  Colors.white,
                ],
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              leading: Icon(
                Icons.account_circle,
                color: cPrimaryBase,
                size: 35,
              ),
              title: Text(
                patientName,
                style: textStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: cBlackBase),
              ),
              trailing: Badge(
                elevation: 0,
                badgeColor: paintBadge,
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                shape: BadgeShape.square,
                borderRadius: BorderRadius.circular(20),
                toAnimate: false,
                badgeContent: Text(
                  badgeText,
                  style:
                      TextStyle(color: fontColor, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
