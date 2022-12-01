import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';

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
          if (!_customTileExpanded) ...[
            BoxShadow(
              color: cWhiteDark,
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
                            style: textStyle.copyWith(fontSize: 12),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Nurul Zakiah',
                            style: textStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Specialist - Nurse',
                            style: textStyle.copyWith(fontSize: 12),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nurul Zakiah',
                            style: textStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Nov 2, 2022',
                            style: textStyle.copyWith(fontSize: 12),
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
                        Text.rich(
                          style: textStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: cBlackBase),
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
                          style: textStyle.copyWith(
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
                              style: textStyle.copyWith(fontSize: 12),
                            ),
                            Spacer(),
                            Text(
                              '150 cm',
                              style: textStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 18),
                            SizedBox(width: 10),
                            Text(
                              'Weight',
                              style: textStyle.copyWith(fontSize: 12),
                            ),
                            Spacer(),
                            Text(
                              '54 kg',
                              style: textStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 18),
                            SizedBox(width: 10),
                            Text(
                              'Blood Pressure',
                              style: textStyle.copyWith(fontSize: 12),
                            ),
                            Spacer(),
                            Text(
                              '180/120 mmHg',
                              style: textStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 18),
                            SizedBox(width: 10),
                            Text(
                              'Sugar Analysis',
                              style: textStyle.copyWith(fontSize: 12),
                            ),
                            Spacer(),
                            Text(
                              '110 mg/dL',
                              style: textStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 18),
                            SizedBox(width: 10),
                            Text(
                              'Body Temperature',
                              style: textStyle.copyWith(fontSize: 12),
                            ),
                            Spacer(),
                            Text(
                              '36 C',
                              style: textStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 18),
                            SizedBox(width: 10),
                            Text(
                              'Resting Heart Rate',
                              style: textStyle.copyWith(fontSize: 12),
                            ),
                            Spacer(),
                            Text(
                              '80 bpm',
                              style: textStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 18),
                            SizedBox(width: 10),
                            Text(
                              'Breath Rate',
                              style: textStyle.copyWith(fontSize: 12),
                            ),
                            Spacer(),
                            Text(
                              '16 rpm',
                              style: textStyle.copyWith(fontSize: 12),
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
