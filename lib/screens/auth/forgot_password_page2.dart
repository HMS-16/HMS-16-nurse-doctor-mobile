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
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            Image(
              image: const AssetImage(
                "assets/images/forgot-password.png",
              ),
              fit: BoxFit.contain,
              width: double.maxFinite,
              height: 220,
            ),
            SizedBox(height: 30),
            Text(
              "Enter the verification code we just sent you on your email addrress",
              textAlign: TextAlign.center,
              style: textStyle.copyWith(
                  color: cBlackBase, fontSize: 14, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 30),
            OtpTextField(
              numberOfFields: 4,
              borderColor: cPrimaryBase,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                durationDialog(context, "Code Verify!");
              },
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
                  onTap: () {},
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
              child: Text("VERIFY"),
              margin: const EdgeInsets.only(top: 30),
              onpressed: () {
                FocusManager.instance.primaryFocus!.unfocus();
                navPushTransition(context, const ForgotPassword3());
              },
            )
          ],
        ),
      ),
    );
  }
}
