import 'package:flutter/material.dart';

class TileMedDiagnosis extends StatefulWidget {
  const TileMedDiagnosis({super.key});

  @override
  State<TileMedDiagnosis> createState() => _TileMedDiagnosisState();
}

class _TileMedDiagnosisState extends State<TileMedDiagnosis> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        boxShadow: [
          if (!_customTileExpanded) ...[
            BoxShadow(
              blurRadius: 20,
              spreadRadius: -17,
            ),
          ],
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: ExpansionTile(
              iconColor: Colors.black54,
              textColor: Colors.black,
              backgroundColor: Color(0xffE3E3E3),
              collapsedBackgroundColor: Colors.white,
              leading: Icon(Icons.account_circle, size: 38),
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
                      Text(
                        'Diagnosis',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 5),
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
                        'Medicine',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 5),
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
                    ],
                  ),
                ),
              ],
            ),
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
                    Color(0xffDD9F00),
                    Color(0xffFFE977),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
