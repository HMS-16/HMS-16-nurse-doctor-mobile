import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TileMedDiagnosis extends StatefulWidget {
  TileMedDiagnosis({
    super.key,
    required this.doctor,
    required this.date,
    required this.time,
    required this.diagnose,
    required this.prescription,
  });
  String doctor;
  DateTime date;
  String time;
  String diagnose;
  String prescription;

  @override
  State<TileMedDiagnosis> createState() => _TileMedDiagnosisState();
}

class _TileMedDiagnosisState extends State<TileMedDiagnosis> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    // final dateNow = widget.date;
    final tanggal = DateFormat('EEEE, LLL d, y').format(widget.date);
    // final startTime = DateFormat('jm').format(widget.date);
    // final end = dateNow.add(Duration(hours: 1));
    // final endTime = DateFormat('jm').format(end);

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
                  widget.time,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                if (_customTileExpanded) ...[
                  SizedBox(height: 5),
                  Text(
                    'Doctor - ${widget.doctor}',
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
                    Text(
                      'Diagnose',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '${widget.diagnose}',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
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
                    Text(
                      '${widget.prescription}',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
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
