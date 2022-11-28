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
            title: const Text(
              "Hi Dr. Abed!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: const Text(
              "Let's check your schedule today",
              style: TextStyle(color: Colors.black, fontSize: 13),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Colors.black,
                    )),
                CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  child: const Text("MK"),
                ),
              ],
            ),
          ),
          Tile(
            title: const Text(
              "Patient Statistic",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(DateFormat("EEE, d MMM yy").format(DateTime.now())),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "WEEK",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "MONTH",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "YEAR",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )),
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
                    gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(96, 140, 206, 1),
                          Colors.white,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                SplineSeries(
                  dataSource: data,
                  color: const Color.fromRGBO(96, 140, 206, 1),
                  width: 4,
                  markerSettings: const MarkerSettings(
                      width: 12,
                      height: 12,
                      color: Colors.black,
                      borderWidth: 2,
                      shape: DataMarkerType.circle,
                      isVisible: true,
                      borderColor: Colors.white),
                  xValueMapper: (ChartData data, _) => data.day,
                  yValueMapper: (ChartData data, _) => data.patient,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                "Mon",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Tue",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Wed",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Thu",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Fri",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Tile(
              title: const Text("Today's Schedule",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle:
                  Text(DateFormat("EEE, d MMM yy").format(DateTime.now()))),
          Expanded(
              child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          children: [
                            Tile(
                              leading: CircleAvatar(
                                  backgroundColor: Colors.grey.shade800),
                              title: const Text(
                                "Alief Rachman",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              subtitle: const Text("Headache"),
                              trailing: Container(
                                margin: const EdgeInsets.only(top: 40),
                                padding: const EdgeInsets.all(5),
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.fromLTRB(70, 10, 0, 20),
                              child: Text(
                                "1.30 pm - 2.30 pm",
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 40,
                        left: 5,
                        child: Container(
                          height: 70,
                          width: 5,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(0, 97, 228, 1),
                                  Color.fromRGBO(192, 219, 255, 1),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              // color: Colors.blue,
                              borderRadius: BorderRadius.circular(30)),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          children: [
                            Tile(
                              leading: CircleAvatar(
                                  backgroundColor: Colors.grey.shade800),
                              title: const Text(
                                "Nurul Zakiah",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              subtitle: const Text("Headache"),
                              trailing: Container(
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.only(top: 40),
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.fromLTRB(70, 10, 0, 20),
                              child: Text(
                                "1.30 pm - 2.30 pm",
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 40,
                        left: 5,
                        child: Container(
                          height: 70,
                          width: 5,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(221, 159, 0, 1),
                                  Color.fromRGBO(255, 233, 119, 1),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              // color: Colors.blue,
                              borderRadius: BorderRadius.circular(30)),
                        ))
                  ],
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
  final Widget title;
  final Widget? subtitle;
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
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      leading: leading,
    );
  }
}
