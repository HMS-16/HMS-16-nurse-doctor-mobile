import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/views/auth/forgot_password_page3.dart';
import 'package:hms_16/widget/button.dart';
import 'package:hms_16/widget/navpush_transition.dart';

class ForgotPassword2 extends StatelessWidget {
  const ForgotPassword2({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image(
                image: const AssetImage(
                  "assets/assets/Email-campaign-pana1.png",
                ),
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width,
                height: 300,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "Enter the verification code we just sent you on your email addrress",
                textAlign: TextAlign.center,
                style: textStyle.copyWith(fontSize: 15),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 50,
                  width: 50,
                  color: Colors.grey.shade400,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 50,
                  width: 50,
                  color: Colors.grey.shade400,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 50,
                  width: 50,
                  color: Colors.grey.shade400,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 50,
                  width: 50,
                  color: Colors.grey.shade400,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "If you don't receive a code! Resend code",
              style: textStyle,
            ),
            Button(
                text: "VERIFY",
                margin: const EdgeInsets.only(top: 30),
                onpressed: () {
                  navPushTransition(context, const ForgotPassword3());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPassword3(),
                      ));
                })
          ],
        ),
      ),
    );
  }
}
