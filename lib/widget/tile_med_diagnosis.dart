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
              color: Color(0xff6F6F6F1F),
              blurRadius: 20,
              spreadRadius: -8,
            ),
          ],
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Theme(
              data: ThemeData().copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                iconColor: Colors.black54,
                textColor: Colors.black,
                backgroundColor: Color(0xffF2F2F2),
                collapsedBackgroundColor: Color(0xffFDFDFD),
                tilePadding: EdgeInsets.only(
                  top: 10,
                  left: 65,
                  right: 20,
                  bottom: 10,
                ),
                trailing: Icon(_customTileExpanded
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_right),
                title: _customTileExpanded
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text(
                            'Nov 2, 2022',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Nurul Zakiah',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Specialist - Doctor',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nurul Zakiah',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Nov 2, 2022',
                            style: TextStyle(fontSize: 12),
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
          Positioned(
            top: 17,
            left: 20,
            child: Icon(
              Icons.account_circle,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
