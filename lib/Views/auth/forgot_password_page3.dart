import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/widget/button.dart';

class ForgotPassword3 extends StatelessWidget {
  const ForgotPassword3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: cBlack),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Forgot Password',
          style: textStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 70),
            child: Text(
              "Create your new password",
              style: textStyle.copyWith(fontSize: 15),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("New Password"),
                labelStyle: textStyle.copyWith(color: Colors.black),
                hintText: "Create new password",
                prefixIcon: Icon(Icons.email),
                suffixIcon: Icon(Icons.lock),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Confirm New Password"),
                labelStyle: textStyle.copyWith(color: Colors.black),
                hintText: "Confirm new password",
                prefixIcon: Icon(Icons.email),
                suffixIcon: Icon(Icons.lock),
              ),
            ),
          ),
          Button(
              text: "SAVE",
              bgcolor: Colors.blueAccent,
              margin: EdgeInsets.only(top: 30),
              onpressed: () {})
        ],
      ),
    );
  }
}
