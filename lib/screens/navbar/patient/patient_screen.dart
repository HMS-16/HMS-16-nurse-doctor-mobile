import 'package:flutter/material.dart';
import 'package:hms_16/view_model/patient_view_model.dart';
import 'package:hms_16/screens/notification.dart';
import 'package:hms_16/screens/profile/profile.dart';
import 'package:hms_16/model/patient_model.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/screens/navbar/patient/patient_detail/patient_detail.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:hms_16/widget/patient_card.dart';
<<<<<<< HEAD
import 'package:hms_16/widget/status/error_max.dart';
import 'package:hms_16/widget/status/loading_max.dart';
=======
>>>>>>> origin/insertCondition
import 'package:provider/provider.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: cBlack),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Patient',
            style: textStyle.copyWith(
                fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
          ),
          actions: [
            IconButton(
              onPressed: () {
                navPushTransition(context, const NotificationPage());
              },
              icon: const Icon(Icons.notifications),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: InkWell(
                onTap: () {
                  navPushTransition(context, const ProfilePage());
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image(image: AssetImage("assets/images/avatar.png")),
                ),
              ),
            )
          ],
        ),
        body: Builder(builder: (context) {
          return Consumer<PatientViewModel>(
            builder: (context, value, child) {
              switch (value.state) {
                case ActionState.loading:
                  return const LoadingMax();
                case ActionState.none:
                  return const MyWidget();
                case ActionState.error:
                  return const ErrorMax();
              }
            },
          );
        }));
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PatientViewModel>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 48,
            child: TextField(
              onChanged: (value) {
                provider.searchPatient(value);
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                label: Text('Search'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
=======
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: cBlack),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Patient',
          style: textStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
        ),
        actions: [
          IconButton(
            onPressed: () {
              navPushTransition(context, const NotificationPage());
            },
            icon: const Icon(Icons.notifications),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {
                navPushTransition(context, const ProfilePage());
              },
              child: const CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image(image: AssetImage("assets/images/avatar.png")),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 48,
              child: TextField(
                onChanged: (value) {
                  context.read<PatientViewModel>().searchPatient(value, value);
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  label: Text('Search'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
>>>>>>> origin/insertCondition
                  ),
                ),
              ),
            ),
<<<<<<< HEAD
          ),
          const SizedBox(height: 24),
          Consumer<PatientViewModel>(builder: (context, value, child) {
            return _screenValidator(value.persons);
          }),
        ],
=======
            const SizedBox(height: 24),
            Consumer<PatientViewModel>(builder: (context, value, child) {
              // return PatientList(persons: patients);
              return _screenValidator(value.persons);
            }),
          ],
        ),
>>>>>>> origin/insertCondition
      ),
    );
  }
}

Widget _screenValidator(Iterable<PatientModel> patient) {
  if (patient.isNotEmpty) {
<<<<<<< HEAD
    return PatientList(persons: patient.toList());
  } else if (patient.isEmpty) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            child: Image.asset(
              'assets/images/no_data.png',
            ),
          ),
          const Text("There is no Patient Matched"),
        ],
      ),
    );
  }

=======
    return PatientList(persons: patients);
  }
  if (patient.isEmpty) {
    return const Center(
      child: Text("There is no Patient Matched"),
    );
  }
>>>>>>> origin/insertCondition
  return PatientList(persons: patients);
}

class PatientList extends StatelessWidget {
  final List<PatientModel> persons;

  const PatientList({super.key, required this.persons});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final person = persons.elementAt(index);
          return InkWell(
            onTap: () {
              context.read<PatientViewModel>().selectedPerson(person);
              navPushTransition(context, const PatientDetail());
            },
            child: Builder(builder: (context) {
              Color lineColor = cPrimaryBase;
              Color fontColor = cPrimaryDark;
              Color badgeColor = cSecondaryLighter;
              String condition = 'Process';

              if (person.progress == false) {
                lineColor = cGreenLine;
                condition = 'Done';
                badgeColor = cSuccessLightest;
                fontColor = cSuccessDark;
              }
              return PatientCard(
                fontColor: fontColor,
                lineColor: lineColor,
                paintBadge: badgeColor,
                patientName: person.name,
                disease: person.disease,
                time: person.time == 0
                    ? "1.00 pm - 1.30 pm"
                    : person.time == 1
                        ? "1.30 pm - 2.00 pm"
                        : person.time == 2
                            ? "2.00 pm - 2.30 pm"
                            : "2.30 pm - 3.00 pm",
                badgeText: condition,
              );
            }),
          );
        },
        itemCount: persons.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      ),
    );
  }
}
