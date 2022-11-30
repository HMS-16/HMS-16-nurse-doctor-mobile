
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hms_16/Widgets/button.dart';

class ForgotPassword3 extends StatelessWidget {
  const ForgotPassword3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: Text(
          "Forgot Password",
          style: GoogleFonts.balsamiqSans(fontSize: 20, color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 70),
            child: Text(
              "Create your new password",
              style: GoogleFonts.balsamiqSans(fontSize: 15),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              decoration: InputDecoration(

                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                label: Text("New Password"),
                labelStyle: GoogleFonts.balsamiqSans(
                    textStyle: TextStyle(color: Colors.black)),
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
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                label: Text("Confirm New Password"),
                labelStyle: GoogleFonts.balsamiqSans(
                    textStyle: TextStyle(color: Colors.black)),
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
