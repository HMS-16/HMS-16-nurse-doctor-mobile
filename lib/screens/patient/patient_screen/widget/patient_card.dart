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
            height: 60,
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
