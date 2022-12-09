import 'package:flutter/material.dart';
import 'package:hms_16/view_model/patient_view_model.dart';
import 'package:hms_16/screens/notification.dart';
import 'package:hms_16/screens/profile/profile.dart';
import 'package:hms_16/model/patient_model.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/screens/navbar/patient/patient_detail/patient_detail.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:hms_16/widget/patient_card.dart';
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
            icon: const Icon(Icons.notifications_none),
          ),
          IconButton(
            onPressed: () {
              navPushTransition(context, ProfilePage());
            },
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 48,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  label: Text('Search'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Consumer<PatientViewModel>(builder: (context, value, child) {
              return PatientList(persons: value.persons);
            }),
          ],
        ),
      ),
    );
  }
}

class PatientList extends StatelessWidget {
  final List<PatientModel> persons;

  const PatientList({super.key, required this.persons});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final person = persons.elementAt(index);
          return InkWell(
            onTap: () {
              context.read<PatientViewModel>().selectedPerson(person);
              navPushTransition(context, const PatientDetail());
            },
            child: PatientCard(
              patientName: person.name,
              disease: person.disease,
              time: '1 pm - 3 pm',
            ),
          );
        },
        itemCount: persons.length,
        separatorBuilder: (context, index) => const SizedBox(height: 20),
      ),
    );
  }
}
