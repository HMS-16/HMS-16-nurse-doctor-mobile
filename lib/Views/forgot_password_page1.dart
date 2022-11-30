import 'package:hms_16/Views/forgot_password_page2.dart';
import 'package:hms_16/Widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  "https://user-images.githubusercontent.com/51419598/152648731-567997ec-ac1c-4a9c-a816-a1fb1882abbe.png"),
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width,
              height: 100,
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
              text: "SEND",
              bgcolor: Colors.black,
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