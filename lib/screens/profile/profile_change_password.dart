import 'package:flutter/material.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/widget/duration_dialog.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: cBlack),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Change Password',
          style: textStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 5, 0),
              child: Text("Last Password"),
            ),
            BuildPassField(
              hint: "Enter your last password",
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                alignment: Alignment.center,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 5, 0),
              child: Text(
                "Create New Password",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 5, 0),
              child: Text("New Password"),
            ),
            BuildPassField(
              hint: "Create New password",
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 5, 0),
              child: Text("Confirm New Password"),
            ),
            BuildPassField(
              hint: "Confirm New password",
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: cPrimaryBase,
                      minimumSize: Size(MediaQuery.of(context).size.width, 50)),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        title: Text("Confirm To Change Password ?"),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      backgroundColor: cPrimaryBase,
                                      minimumSize: Size(130, 50)),
                                  onPressed: () {
                                    durationDialog(context,
                                        "Password Changed Successfully!");
                                  },
                                  child: Text("Yes")),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      side: BorderSide(color: cPrimaryBase),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      backgroundColor: Colors.white,
                                      minimumSize: Size(130, 50)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "No",
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text("Send")),
            )
          ],
        ),
      ),
    );
  }
}

class BuildPassField extends StatelessWidget {
  final String hint;
  const BuildPassField({
    Key? key,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: hint,
          suffixIcon: Icon(
            Icons.visibility_off,
            color: cBlack,
          ),
          prefixIcon: Icon(
            Icons.lock,
            color: cBlack,
          ),
        ),
      ),
    );
  }
}
