import 'package:flutter/material.dart';
import 'package:hms_16/screens/notification.dart';
import 'package:hms_16/screens/profile/profile.dart';
import 'package:hms_16/view_model/auth_view_model.dart';
import 'package:hms_16/view_model/patient_view_model.dart';
import 'package:hms_16/model/patient_model.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/screens/navbar/patient/patient_detail/patient_detail.dart';
import 'package:hms_16/widget/dialog_validation.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:hms_16/widget/patient_card.dart';
import 'package:hms_16/widget/status/loading_max.dart';
import 'package:provider/provider.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<PatientViewModel>().getAllPatient(context);
    });
    super.initState();
  }

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
            icon: Icon(
              Icons.notifications,
              color: cPrimaryBase,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {
                navPushTransition(context, ProfilePage());
              },
              icon: Consumer<AuthViewModel>(
                builder: (context, value, child) {
                  return CircleAvatar(
                    backgroundColor: cPrimaryBase,
                    minRadius: 40,
                    child: LayoutBuilder(builder: (context, constraints) {
                      if (value.profile!.role == 1) {
                        return Image(
                          image: AssetImage("assets/images/doctor_icon.png"),
                        );
                      } else {
                        return Image(
                          image: AssetImage("assets/images/nurse_icon.png"),
                        );
                      }
                    }),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: Builder(
        builder: (context) {
          return Consumer<PatientViewModel>(
            builder: (context, value, child) {
              switch (value.patientState) {
                case ActionState.loading:
                  return Center(child: LoadingMax(color: cInfoLight));
                case ActionState.none:
                  return MyWidget();
                // case ActionState.error:
                //   return Center(
                //     child: Text('error'),
                //   );
              }
            },
          );
        },
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<PatientViewModel>();
    return ListView(
      padding: const EdgeInsets.all(16.0),
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
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        // _screenValidator(provider.persons),
        Consumer<PatientViewModel>(builder: (context, value, child) {
          return _screenValidator(value.filterPatients, value.persons);
        }),
      ],
    );
  }
}

Widget _screenValidator(List search, List<DataPatient> patient) {
  patient.sort((a, b) => a.status.compareTo(b.status));
  if (search.isNotEmpty) {
    return PatientList(persons: search);
  }
  if (search.isEmpty) {
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
  // final variabel = jsonEncode(search);
  // print("mockingbird = $variabel");
  return PatientList(persons: patient);
}

class PatientList extends StatelessWidget {
  final List persons;

  PatientList({super.key, required this.persons});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
            // Consumer<PatientViewModel>(
            //   builder: (context, value, chiild) {
            Color lineColor = cPrimaryBase;
            Color fontColor = cPrimaryDark;
            Color badgeColor = cSecondaryLighter;
            String condition = 'Process';
            // print(person);

            if (person!.status != 0) {
              lineColor = cGreenLine;
              condition = 'Done';
              badgeColor = cSuccessLightest;
              fontColor = cSuccessDark;
            }
            return PatientCard(
              fontColor: fontColor,
              lineColor: lineColor,
              paintBadge: badgeColor,
              patientName: person!.name,
              badgeText: condition,
            );
          }),
          //   },
          // ),
        );
      },
      itemCount: persons.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}
