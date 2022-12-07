import 'package:flutter/material.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/screens/auth/forgot_password_page3.dart';
import 'package:hms_16/widget/button.dart';
import 'package:hms_16/widget/duration_dialog.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

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
                  "assets/images/forgot-password.png",
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
                style: textStyle.copyWith(
                    color: cBlackBase,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OtpTextField(
                  numberOfFields: 4,
                  borderColor: cPrimaryBase,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    durationDialog(context, "Code Verify!");
                  }, // end onSubmit
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "If you didn't receive a code! ",
                  style: TextStyle(
                    color: cBlackLightest,
                    fontSize: 12,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(builder: (builder) => SignUpPage()),
                    //     (route) => false);
                  },
                  child: Text(
                    "Resend Code",
                    style: TextStyle(
                      color: cPrimaryBase,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
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
