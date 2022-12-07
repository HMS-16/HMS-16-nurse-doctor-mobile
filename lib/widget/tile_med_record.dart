import 'package:flutter/material.dart';
import 'package:hms_16/utils/constant.dart';

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
            collapsedBackgroundColor: Color(0xffFDFDFD),
            tilePadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
    );
  }
}
