import 'package:hms_16/Views/forgot_password_page3.dart';
import 'package:hms_16/Widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword2 extends StatelessWidget {
  const ForgotPassword2({super.key});

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
            margin: EdgeInsets.symmetric(vertical: 30),
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "Enter the verification code we just sent you on your email addrress",
              textAlign: TextAlign.center,
              style: GoogleFonts.balsamiqSans(fontSize: 15),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: 50,
                color: Colors.grey.shade400,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: 50,
                color: Colors.grey.shade400,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: 50,
                color: Colors.grey.shade400,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: 50,
                color: Colors.grey.shade400,
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "If you don't receive a code! Resend code",
            style: GoogleFonts.balsamiqSans(),
          ),
          Button(
              text: "VERIFY",
              bgcolor: Colors.black,
              margin: EdgeInsets.only(top: 30),
              onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPassword3(),
                    ));
              })
        ],
      ),
    );
  }
}
