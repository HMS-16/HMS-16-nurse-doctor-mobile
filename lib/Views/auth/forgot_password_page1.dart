import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/views/auth/forgot_password_page2.dart';
import 'package:hms_16/widget/button.dart';
import 'package:hms_16/widget/navpush_transition.dart';

class ForgotPassword1 extends StatelessWidget {
  const ForgotPassword1({super.key});

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
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Image(
              image: AssetImage(
                "assets/forgot_password.png",
              ),
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width,
              height: 200,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 70),
            child: Text(
              "Please enter your email address",
              style: textStyle.copyWith(fontSize: 15),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Email"),
                labelStyle: textStyle.copyWith(color: Colors.black),
                hintText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
            ),
          ),
          Button(
              text: "Send",
              bgcolor: Colors.blueAccent,
              margin: EdgeInsets.only(top: 30),
              onpressed: () {
                navPushTransition(context, const ForgotPassword2());
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const ForgotPassword2(),
                //     ));
              })
        ],
      ),
    );
  }
}
