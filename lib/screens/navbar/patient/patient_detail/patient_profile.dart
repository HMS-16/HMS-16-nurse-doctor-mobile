import 'package:flutter/material.dart';
import 'package:hms_16/view_model/patient_view_model.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/widget/duration_dialog.dart';
import 'package:hms_16/widget/text_box.dart';
import 'package:provider/provider.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({super.key});

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<PatientViewModel>(builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      value.person!.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(value.person!.medRecord),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Doctor',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextBox(
                height: 43,
                width: double.infinity,
                child: Text(
                  value.person!.doctor,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: cWhiteLast),
                ),
              ),
              const Text(
                'Nurse',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextBox(
                height: 43,
                width: double.infinity,
                child: Text(
                  value.person!.nurse,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: cWhiteLast),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Gender',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextBox(
                          height: 43,
                          width: double.maxFinite,
                          child: Text(
                            value.person!.gender,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: cWhiteLast),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Date of Birth',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextBox(
                          height: 43,
                          width: double.maxFinite,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              value.person!.dateBirth,
                              softWrap: false,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(color: cWhiteLast),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Blood Type',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextBox(
                          height: 43,
                          width: double.maxFinite,
                          child: Text(
                            value.person!.bloodType,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: cWhiteLast),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Status',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextBox(
                          height: 43,
                          width: double.maxFinite,
                          child: Text(
                            value.person!.status,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: cWhiteLast),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Text(
                'Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextBox(
                height: 43,
                width: double.infinity,
                child: Text(
                  value.person!.address,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: cWhiteLast),
                ),
              ),
              const Text(
                'Phone Number',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextBox(
                height: 43,
                width: double.infinity,
                child: Text(
                  value.person!.phone,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: cWhiteLast),
                ),
              ),
              const Text(
                'Register Date',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextBox(
                height: 43,
                width: double.infinity,
                child: Text(
                  value.person!.register,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: cWhiteLast),
                ),
              ),
              const SizedBox(height: 16),
              Builder(builder: (context) {
                final show = value.person!.progress;
                if (show == true) {
                  return ElevatedButton(
                    onPressed: () async {
                      // context.read<changestate>()

                      await showDialog<void>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Are you sure to end case this patient?',
                              textAlign: TextAlign.center,
                              style: textStyle.copyWith(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            content: Image(
                              image: const AssetImage(
                                "assets/images/succes.png",
                              ),
                              fit: BoxFit.contain,
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                            ),
                            actions: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          backgroundColor: cPrimaryBase,
                                        ),
                                        onPressed: () async {
                                          context
                                              .read<PatientViewModel>()
                                              .changeProgressPatient(false);
                                          durationDialog(
                                              context, "End case succesfully!");
                                          Future.delayed(
                                              const Duration(seconds: 2), () {
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Text(
                                          "Yes",
                                          style: textStyle.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1,
                                                  color: cPrimaryBase),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          backgroundColor: cWhiteBase,
                                        ),
                                        onPressed: () async {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "No",
                                          style: textStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: cPrimaryBase),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(155, 26, 26, 1),
                      minimumSize: const Size.fromHeight(51),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'End Case',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              })
            ],
          );
        }),
      ),
    );
  }
}
