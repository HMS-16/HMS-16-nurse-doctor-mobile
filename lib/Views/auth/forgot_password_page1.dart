import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/views/auth/forgot_password_page2.dart';
import 'package:hms_16/widget/button.dart';
import 'package:hms_16/widget/navpush_transition.dart';

class ForgotPassword1 extends StatelessWidget {
  const ForgotPassword1({super.key});

  @override
  Widget build(BuildContext context) {
    late String email;
    TextEditingController controllerEmail = TextEditingController();
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
                  "assets/Email-campaign-pana1.png",
                ),
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width,
                height: 200,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                "Please Enter Your Email Address",
                style: textStyle.copyWith(
                    color: cBlackBase,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "Email ",
                  style: textStyle.copyWith(color: cBlackBase, fontSize: 14),
                ),
                Text(
                  "*",
                  style: textStyle.copyWith(color: cRed, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: controllerEmail,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please a Enter';
                }
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value)) {
                  return 'Please a valid Email';
                }
                return null;
              },
              onSaved: (value) {
                email = value!;
              },
              decoration: InputDecoration(
                  errorStyle: textStyle.copyWith(color: Colors.red),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                  ),
                  hintText: "Email",
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
            ),
            // const SizedBox(
            //   height: 3.0,
            // ),
            Button(
                text: "Send",
                bgcolor: Colors.blueAccent,
                margin: const EdgeInsets.only(top: 30),
                onpressed: () {
                  navPushTransition(context, const ForgotPassword2());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPassword2(),
                      ));
                })
          ],
        ),
      ),
    );
  }
}
