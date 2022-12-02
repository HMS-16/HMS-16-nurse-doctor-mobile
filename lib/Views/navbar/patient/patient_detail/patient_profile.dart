import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/widget/duration_dialog.dart';
import 'package:hms_16/widget/text_box.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: const [
                  Text(
                    "Nama Pasien",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('123456789'),
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
                'Hansi Flick',
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
                'Jamal Musiala',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: cWhiteLast),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                      width: 166,
                      child: Text(
                        'Male',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: cWhiteLast),
                      ),
                    ),
                    const Text(
                      'Blood Type',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextBox(
                      height: 43,
                      width: 166,
                      child: Text(
                        'O',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: cWhiteLast),
                      ),
                    ),
                  ],
                ),
                Column(
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
                      width: 166,
                      child: Text(
                        'Tokyo, 08-25-2000',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: cWhiteLast),
                      ),
                    ),
                    const Text(
                      'Status',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextBox(
                      height: 43,
                      width: 166,
                      child: Text(
                        'Process',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: cWhiteLast),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Text(
              'Age',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextBox(
              height: 43,
              width: 166,
              child: Text(
                '22 Years',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: cWhiteLast),
              ),
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
                'Jl. Jalan No.3, Kota Tiga',
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
                '+62 813 1313 1313',
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
                'November 10, 2022',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: cWhiteLast),
              ),
            ),
            const Text(
              'Case Description',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextBox(
              width: double.infinity,
              height: 140,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Experiencing symptoms :',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: cWhiteLast),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 10.0,
                                  color: cWhiteLast,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Red on the Throat',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(color: cWhiteLast),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 10.0,
                                  color: cWhiteLast,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'The salivary glands are enlarged',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(color: cWhiteLast),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 10.0,
                                  color: cWhiteLast,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Mild respiratory distress',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(color: cWhiteLast),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    backgroundColor: cPrimaryBase,
                                  ),
                                  onPressed: () async {
                                    durationDialog(
                                        context, "End case succesfully!");
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
                                            width: 1, color: cPrimaryBase),
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
            )
          ],
        ),
      ),
    );
  }
}
