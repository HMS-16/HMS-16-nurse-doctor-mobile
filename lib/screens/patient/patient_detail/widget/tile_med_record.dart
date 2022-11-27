import 'package:flutter/material.dart';

class TileMedRecord extends StatefulWidget {
  const TileMedRecord({super.key});

  @override
  State<TileMedRecord> createState() => _TileMedRecordState();
}

class _TileMedRecordState extends State<TileMedRecord> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            spreadRadius: -18,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            ExpansionTile(
              iconColor: Colors.black54,
              textColor: Colors.black,
              backgroundColor: Color(0xffE3E3E3),
              collapsedBackgroundColor: Colors.white,
              leading: Icon(Icons.account_circle),
              tilePadding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
              title: Text(
                'Nurul Zakiah',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nov 2, 2022',
                    style: TextStyle(fontSize: 12),
                  ),
                  _customTileExpanded ? Text(
                    'Specialist - Nurse',
                    style: TextStyle(fontSize: 12),
                  ) : SizedBox() ,
                ],
              ),
              onExpansionChanged: (bool expanded) {
                setState(() => _customTileExpanded = expanded);
              },
              children: <Widget>[
                ListTile(
                  title: ListView(
                    physics: NeverScrollableScrollPhysics(),
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
                          Spacer(),
                          Text(
                            '150 cm',
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
                          Spacer(),
                          Text(
                            '54 kg',
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
                          Spacer(),
                          Text(
                            '180/120 mmHg',
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
                          Spacer(),
                          Text(
                            '110 mg/dL',
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
                          Spacer(),
                          Text(
                            '36 C',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.circle, size: 18),
                          SizedBox(width: 10),
                          Text(
                            'Resting Heart Rate',
                            style: TextStyle(fontSize: 12),
                          ),
                          Spacer(),
                          Text(
                            '80 bpm',
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
                          Spacer(),
                          Text(
                            '16 rpm',
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
            Positioned(
              top: 26,
              child: Container(
                width: 4,
                height: _customTileExpanded ? 200 : 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff0061E4),
                      Color(0xffC0DBFF),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
