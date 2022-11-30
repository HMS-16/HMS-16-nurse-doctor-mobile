import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/widget/text_box.dart';

class PatientProfileNurse extends StatefulWidget {
  const PatientProfileNurse({super.key});

  @override
  State<PatientProfileNurse> createState() => _PatientProfileNurseState();
}

class _PatientProfileNurseState extends State<PatientProfileNurse> {
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
              readOnly: true,
              maxLines: 5,
              decoration: InputDecoration(
                  fillColor: cWhiteDarker,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText:
                      "Experiencing symptoms :\n Red on the Throat\n The salivary glands are enlarged\n Mild respiratory distress"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
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
