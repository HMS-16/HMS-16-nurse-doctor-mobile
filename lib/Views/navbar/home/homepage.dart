import 'package:flutter/material.dart';
import 'package:hms_16/models/chart_model.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/views/notification.dart';
import 'package:hms_16/views/profile.dart';
import 'package:hms_16/widget/navpush_transition.dart';
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
      appBar: AppBar(
        iconTheme: IconThemeData(color: cBlack),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Dr. Abed!',
              style: textStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
            ),
            Text(
              "Let's check your schedule today",
              style: textStyle.copyWith(color: Colors.black, fontSize: 13),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              navPushTransition(context, const NotificationPage());
            },
            icon: const Icon(Icons.notifications_none),
          ),
          IconButton(
            onPressed: () {
              navPushTransition(context, const ProfilePage());
            },
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Tile(
            title: Text(
              "Patient Statistic",
              style: textStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(DateFormat("EEE, d MMM yy").format(DateTime.now())),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "WEEK",
                      style: textStyle.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "MONTH",
                      style: textStyle.copyWith(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "YEAR",
                      style: textStyle.copyWith(
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
            children: [
              Text(
                "Mon",
                style: textStyle.copyWith(fontSize: 16),
              ),
              Text(
                "Tue",
                style: textStyle.copyWith(fontSize: 16),
              ),
              Text(
                "Wed",
                style: textStyle.copyWith(fontSize: 16),
              ),
              Text(
                "Thu",
                style: textStyle.copyWith(fontSize: 16),
              ),
              Text(
                "Fri",
                style: textStyle.copyWith(fontSize: 16),
              ),
            ],
          ),
          Tile(
              title: Text("Today's Schedule",
                  style: textStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: cBlack)),
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
                              title: Text(
                                "Alief Rachman",
                                style: textStyle.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: cBlack),
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
                                style: textStyle.copyWith(
                                    color: cBlackLightest,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
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
                              title: Text(
                                "Nurul Zakiah",
                                style: textStyle.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: cBlack),
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
                                style: textStyle.copyWith(
                                    color: cBlackLightest,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
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
