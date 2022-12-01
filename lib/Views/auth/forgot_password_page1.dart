import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hms_16/views/auth/forgot_password_page2.dart';
import 'package:hms_16/widget/button.dart';

class ForgotPassword1 extends StatelessWidget {
  const ForgotPassword1({super.key});

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
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Image(
              image: NetworkImage(
                "https://cdn.dribbble.com/users/1622791/screenshots/11174104/flutter_intro.png",
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
              style: GoogleFonts.balsamiqSans(fontSize: 15),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Email"),
                labelStyle: GoogleFonts.balsamiqSans(
                    textStyle: TextStyle(color: Colors.black)),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPassword2(),
                    ));
              })
        ],
      ),
    );
  }
}
