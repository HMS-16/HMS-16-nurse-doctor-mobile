import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';
import 'package:intl/intl.dart';

class TileMedRecord extends StatefulWidget {
  TileMedRecord({
    super.key,
    required this.date,
    required this.height,
    required this.weight,
    required this.bloodPressure,
    required this.sugarAnalysis,
    required this.temperature,
    required this.restHeartRate,
    required this.breathRate,
    this.note,
  });
  DateTime date;
  int height;
  int weight;
  String bloodPressure;
  int sugarAnalysis;
  double temperature;
  int restHeartRate;
  int breathRate;
  String? note;

  @override
  State<TileMedRecord> createState() => _TileMedRecordState();
}

class _TileMedRecordState extends State<TileMedRecord> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    final dateNow = widget.date;
    final tanggal = DateFormat('EEEE, LLL d, y').format(dateNow);
    final startTime = DateFormat('jm').format(widget.date);
    final end = dateNow.add(Duration(hours: 1));
    final endTime = DateFormat('jm').format(end);

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
                  '$tanggal',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 6),
                Text(
                  '$startTime - $endTime',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                if (_customTileExpanded) ...[
                  SizedBox(height: 5),
                  Text(
                    'Nurse - Ahmad',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ]
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
                          TextSpan(text: '${widget.note}'),
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
                          '${widget.height} cm',
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
                          '${widget.weight} kg',
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
                          '${widget.bloodPressure} mmHg',
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
                          '${widget.sugarAnalysis} mg/dL',
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
                          '${widget.temperature} C',
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
                          '${widget.restHeartRate} bpm',
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
                          '${widget.breathRate} rpm',
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
