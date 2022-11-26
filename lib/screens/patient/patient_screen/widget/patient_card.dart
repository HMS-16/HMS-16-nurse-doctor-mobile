import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 358,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: Color.fromRGBO(244, 248, 253, 1),
      ),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 70,
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
              leading: const CircleAvatar(),
              title: const Text('Patient 1'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Headache'),
                  SizedBox(height: 20),
                  Text('1.30 pm - 2.30 pm'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
