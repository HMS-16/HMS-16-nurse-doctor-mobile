import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 358,
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
            height: 50,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue,
                  Colors.white,
                ],
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              leading: const Icon(
                Icons.account_circle,
                color: Colors.blue,
                size: 35,
              ),
              title: Text(
                'Patient 1',
                style: textStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: cBlackBase),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Headache',
                    style: textStyle.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: cBlackLightest),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '1.30 pm - 2.30 pm',
                    style: textStyle.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: cBlackLightest),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}