import 'package:flutter/material.dart';
import 'package:hms_16/Models/chart_model.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ChartData> data = [
    ChartData(1, 10),
    ChartData(2, 6),
    ChartData(3, 8),
    ChartData(4, 14),
    ChartData(5, 5),
    ChartData(6, 17),
    ChartData(7, 19),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Tile(
            title: "Hi Dr. Abed",
            subtitle: "Let's check your schedule today",
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
                CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  child: Text("MK"),
                ),
              ],
            ),
          ),
          Tile(
            title: "Patient Statistic",
            subtitle: DateFormat("EEE, d MMM yy").format(DateTime.now()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextButton(onPressed: () {}, child: Text("WEEK")),
                TextButton(onPressed: () {}, child: Text("MONTH")),
                TextButton(onPressed: () {}, child: Text("YEAR")),
              ],
            ),
          ),
          SizedBox(
            height: 180,
            child: SfCartesianChart(
              borderWidth: 0,
              backgroundColor: Colors.transparent,
              primaryXAxis: NumericAxis(
                  minimum: 1,
                  maximum: 7,
                  isVisible: false,
                  interval: 1,
                  borderWidth: 0,
                  borderColor: Colors.transparent),
              primaryYAxis: NumericAxis(
                  minimum: 1,
                  maximum: 20,
                  interval: 5,
                  isVisible: false,
                  borderWidth: 0,
                  borderColor: Colors.transparent),
              series: <ChartSeries<ChartData, int>>[
                SplineAreaSeries(
                  splineType: SplineType.natural,
                  dataSource: data,
                  xValueMapper: (ChartData data, _) => data.day,
                  yValueMapper: (ChartData data, _) => data.patient,
                  color: Colors.grey.shade200,
                ),
                SplineSeries(
                  dataSource: data,
                  color: Colors.black,
                  width: 4,
                  markerSettings: MarkerSettings(
                      // color: Colors.black,
                      borderWidth: 7,
                      shape: DataMarkerType.circle,
                      isVisible: true,
                      borderColor: Colors.black),
                  xValueMapper: (ChartData data, _) => data.day,
                  yValueMapper: (ChartData data, _) => data.patient,
                )
              ],
            ),
          ),
          Tile(
              title: "Today's Schedule",
              subtitle: DateFormat("EEE, d MMM yy").format(DateTime.now())),
          Expanded(
              child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      children: [
                        Tile(
                          leading: CircleAvatar(
                              backgroundColor: Colors.grey.shade800),
                          title: "Dummy 1",
                          subtitle: "Headache",
                          trailing: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(70, 10, 0, 20),
                          child: Text(
                            "1.30 pm - 2.30 pm",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      children: [
                        Tile(
                          leading: CircleAvatar(
                              backgroundColor: Colors.grey.shade800),
                          title: "Dummy 2",
                          subtitle: "Headache",
                          trailing: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(70, 10, 0, 20),
                          child: Text(
                            "1.30 pm - 2.30 pm",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? trailing;
  final Widget? leading;
  const Tile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: trailing,
      leading: leading,
    );
  }
}
