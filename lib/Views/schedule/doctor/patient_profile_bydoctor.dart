import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/widget/text_box.dart';

class PatientProfileDoctor extends StatefulWidget {
  const PatientProfileDoctor({super.key});

  @override
  State<PatientProfileDoctor> createState() => _PatientProfileDoctorState();
}

class _PatientProfileDoctorState extends State<PatientProfileDoctor> {
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
                children: [
                  Text("Nama Pasien",
                      style: textStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: cBlackBase)),
                  Text('123456789',
                      style: textStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: cBlackBase)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text("5",
                              style: textStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: cBlackBase)),
                          Text("Completed",
                              style: textStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: cBlackBase)),
                          Text("Appointment",
                              style: textStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: cBlackBase)),
                        ],
                      ),
                      Container(
                        width: 1.5,
                        height: 50,
                        color: Colors.black,
                      ),
                      Column(
                        children: [
                          Text("1",
                              style: textStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: cBlackBase)),
                          Text("Upcoming",
                              style: textStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: cBlackBase)),
                          Text("Appointment",
                              style: textStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: cBlackBase)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text('Doctor',
                style: textStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w700, color: cBlack)),
            const TextBox(width: double.infinity, child: 'Hansi Flick'),
            Text('Nurse',
                style: textStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w700, color: cBlack)),
            const TextBox(
              width: double.infinity,
              child: 'Jamal Musiala',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Gender',
                        style: textStyle.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: cBlack)),
                    const TextBox(
                      width: 156,
                      child: 'Male',
                    ),
                    Text('Blood Type',
                        style: textStyle.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: cBlack)),
                    const TextBox(width: 156, child: 'O'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Date of Birth',
                        style: textStyle.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: cBlack)),
                    const TextBox(
                      width: 156,
                      child: 'Tokyo, 08-25-2000',
                    ),
                    Text('Status',
                        style: textStyle.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: cBlack)),
                    const TextBox(
                      width: 156,
                      child: 'Process',
                    ),
                  ],
                ),
              ],
            ),
            Text('Address',
                style: textStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w700, color: cBlack)),
            const TextBox(
              width: double.infinity,
              child: 'Jl. Jalan No.3, Kota Tiga',
            ),
            Text('Phone Number',
                style: textStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w700, color: cBlack)),
            const TextBox(
              width: double.infinity,
              child: '+62 0813 1313 1313',
            ),
            Text('Register Date',
                style: textStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w700, color: cBlack)),
            const TextBox(
              width: double.infinity,
              child: 'November 10, 2022',
            ),
            Text('Case Description',
                style: textStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w700, color: cBlack)),
            TextFormField(
              // readOnly: true,
              maxLines: 5,
              decoration: InputDecoration(
                // fillColor: cWhiteDarker,
                // filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                // hintText:
                //     "Experiencing symptoms :\n Red on the Throat\n The salivary glands are enlarged\n Mild respiratory distress"
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                bool confirm = false;
                await showDialog<void>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                          'Are you sure to end case this outpatient session?',
                          style: textStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: cBlackLightest)),
                      actions: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 120,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: cPrimaryBase,
                                ),
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Yes",
                                  style: textStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "No",
                                  style: textStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: cBlackBase),
                                ),
                              ),
                            ),
                          ],
                        )
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
