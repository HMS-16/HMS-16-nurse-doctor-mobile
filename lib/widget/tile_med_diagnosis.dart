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
              color: Color(0xff6F6F6F),
              blurRadius: 20,
              spreadRadius: -14,
            ),
          ],
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            iconColor: Colors.black54,
            textColor: Colors.black,
            backgroundColor: Color(0xffF2F2F2),
            // collapsedBackgroundColor: Colors.amber,
            collapsedBackgroundColor: Color(0xffFDFDFD),
            tilePadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            trailing: Icon(_customTileExpanded
                ? Icons.keyboard_arrow_down
                : Icons.keyboard_arrow_right),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tuesday, Nov 2, 2022',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 6),
                Text(
                  '1.00 pm - 2.00 pm',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
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
      ),
    );
  }
}