import 'package:flutter/material.dart';
import 'package:hms_16/Views/auth/login_page.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/widget/button.dart';

import '../../widget/navpush_transition.dart';

class ForgotPassword3 extends StatelessWidget {
  const ForgotPassword3({super.key});

  @override
  Widget build(BuildContext context) {
    late String password;
    TextEditingController controllerPassword = TextEditingController();

    final _formKey = GlobalKey<FormState>();
    late final TextStyle? errorStyle;
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
                  "assets/Mobile login-pana 2.png",
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
                "Create your new password",
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
                  "Create Password ",
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
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                // if (value!.isEmpty) {
                //   return 'Please a Enter';
                // }
                // if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                //     .hasMatch(value)) {
                //   return 'Please a valid Email';
                // }
                // return null;
              },
              onSaved: (value) {},
              decoration: InputDecoration(
                  errorStyle: textStyle.copyWith(color: Colors.red),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                  ),
                  hintText: "Create Password",
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Confirm New Password ",
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
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                // if (value!.isEmpty) {
                //   return 'Please a Enter';
                // }
                // if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                //     .hasMatch(value)) {
                //   return 'Please a valid Email';
                // }
                // return null;
              },
              onSaved: (value) {},
              decoration: InputDecoration(
                  errorStyle: textStyle.copyWith(color: Colors.red),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                  ),
                  hintText: "Confirm New Password",
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
            ),
            // const SizedBox(
            //   height: 3.0,
            // ),
            Button(
                text: "SAVE",
                bgcolor: Colors.blueAccent,
                margin: const EdgeInsets.only(top: 30),
                onpressed: () {
                  navPushTransition(context, const LoginPage());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
                })
          ],
        ),
      ),
    );
  }
}
