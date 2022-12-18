import 'package:flutter/material.dart';
import 'package:hms_16/screens/notification.dart';
import 'package:hms_16/screens/profile/profile.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/view_model/auth_view_model.dart';
import 'package:hms_16/widget/dialog_validation.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:hms_16/widget/status/loading_max.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // final id = context.read<AuthViewModel>().idUser;
    final profileViewModel = context.read<AuthViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (profileViewModel.profile == null) {
        await profileViewModel.getProfileById();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteBase,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Consumer<AuthViewModel>(
              builder: (context, value, child) {
                switch (value.authState) {
                  // case ActionState.error:
                  //   return Center(child: Text('error'),);
                  case ActionState.loading:
                    // Future.delayed(Duration(seconds: 2));
                    print('lagi loading (homepage)');
                    return LoadingMax(color: cBlackLight);
                  case ActionState.none:
                    // return Text('Sign In');
                    // default:
                    // print('mana nih datanya');
                    // return Text('Sign In');
                    final username = value.profile!.username;
                    return RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "\nDr. ${username}",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: cBlack,
                            ),
                          ),
                        ],
                        text: "Welcome!",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: cBlack,
                        ),
                      ),
                    );
                }
              },
            ),
            actions: [
              IconButton(
                onPressed: () {
                  dialogValidation(
                    context: context,
                    title: "Coming Soon!",
                    isValidation: false,
                    isImage: false,
                    newPage: () async {
                      await Future.delayed(Duration(seconds: 2), () {
                        Navigator.pop(context);
                      });
                    },
                  );
                  // navPushTransition(context, const NotificationPage());
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
            iconTheme: IconThemeData(color: cBlack),
            // floating: true,
            pinned: true,
            backgroundColor: const Color.fromRGBO(110, 169, 250, 1),
            expandedHeight: 220,
            flexibleSpace: const FlexibleSpaceBar(
              background: Image(
                  // alignment: Alignment.bottomRight,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/Banner.png")),
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              title: const Text("Today's Appointment",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 0.4)),
              subtitle: Text(DateFormat("EEE, MMM d, yyyy")
                  .format(DateTime.now())
                  .toString()),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // return Consumer<PatientViewModel>(
                //     builder: (context, value, child) {
                //   // return PatientList(persons: patients);
                //   return PatientListHomeScreen(persons: patients);
                // });
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}

// class PatientListHomeScreen extends StatelessWidget {
//   final List<PatientModel> persons;

//   const PatientListHomeScreen({super.key, required this.persons});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       physics: const BouncingScrollPhysics(),
//       padding: EdgeInsets.zero,
//       shrinkWrap: true,
//       scrollDirection: Axis.vertical,
//       itemBuilder: (context, index) {
//         final person = persons.elementAt(index);
//         if (DateFormat("EEE, d-M-y").format(person.schedule) ==
//             DateFormat("EEE, d-M-y").format(DateTime.now())) {
//           return InkWell(
//             onTap: () {
//               context.read<PatientViewModel>().selectedPerson(person);
//               navPushTransition(context, const DetailScheduleNurse());
//             },
//             child: Builder(builder: (context) {
//               Color lineColor = cPrimaryBase;
//               Color fontColor = cPrimaryDark;
//               Color badgeColor = cSecondaryLighter;
//               String condition = 'Process';

//               if (person.progress == false) {
//                 lineColor = cGreenLine;
//                 condition = 'Done';
//                 badgeColor = cSuccessLightest;
//                 fontColor = cSuccessDark;
//               }
//               return PatientHomeCard(
//                 fontColor: fontColor,
//                 lineColor: lineColor,
//                 paintBadge: badgeColor,
//                 badgeText: condition,
//                 patientName: person.name,
//                 doctorName: person.doctor,
//                 nurseName: person.nurse,
//                 time: person.time == 0
//                     ? "1.00 pm - 1.30 pm"
//                     : person.time == 1
//                         ? "1.30 pm - 2.00 pm"
//                         : person.time == 2
//                             ? "2.00 pm - 2.30 pm"
//                             : "2.30 pm - 3.00 pm",
//               );
//             }),
//           );
//         }
//         return SizedBox();
//       },
//       itemCount: persons.length,
//     );
//   }
// }
