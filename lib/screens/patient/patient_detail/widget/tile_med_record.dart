import 'package:flutter/material.dart';

class TileMedRecord extends StatelessWidget {
  const TileMedRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            // offset: Offset(-10, -1),
            blurRadius: 20,
            spreadRadius: -10,
            // blurStyle: BlurStyle.outer,
            // spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ExpansionTile(
          iconColor: Colors.black54,
          textColor: Colors.black,
          backgroundColor: Color(0xffE3E3E3),
          collapsedBackgroundColor: Colors.white,
          title: Text(
            'Dr. Nurul Zakiah',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            'Nov 2, 2022',
            style: TextStyle(fontSize: 12),
          ),
          leading: Icon(Icons.account_circle),
          children: <Widget>[
            ListTile(
              title: ListView(
                shrinkWrap: true,
                children: [
                  Text.rich(
                    style: TextStyle(fontSize: 12),
                    TextSpan(
                      text: 'detail note : ',
                      children: [
                        TextSpan(
                            text:
                                'After examination, the results of the medical record showed that the patient had symptoms of the disease, namely redness of the throat, enlarged salivary glands and mild respiratory distress.'),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Medical Measurement',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 7),
                  Row(
                    children: [
                      Icon(Icons.circle, size: 18),
                      SizedBox(width: 10),
                      Text(
                        'Height',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.circle, size: 18),
                      SizedBox(width: 10),
                      Text(
                        'Weight',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.circle, size: 18),
                      SizedBox(width: 10),
                      Text(
                        'Blood Pressure',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.circle, size: 18),
                      SizedBox(width: 10),
                      Text(
                        'Sugar Analysis',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.circle, size: 18),
                      SizedBox(width: 10),
                      Text(
                        'Body Temperature',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.circle, size: 18),
                      SizedBox(width: 10),
                      Text(
                        'Pulse Rate',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.circle, size: 18),
                      SizedBox(width: 10),
                      Text(
                        'Breath Rate',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
