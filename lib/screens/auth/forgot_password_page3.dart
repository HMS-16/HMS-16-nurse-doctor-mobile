import 'package:flutter/material.dart';
import 'package:hms_16/screens/auth/login_page.dart';
import 'package:hms_16/utils/constant.dart';
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
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
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
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
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
                validator: (value) {
                  String msg = '.{8,}';
                  if (value!.isEmpty) {
                    return 'Password can not be empty';
                  }
                  if (!RegExp(msg).hasMatch(value)) {
                    return 'Password length can’t be less than 8 char';
                  }
                  return null;
                },
                onSaved: (value) {},
                decoration: InputDecoration(
                    errorStyle: textStyle.copyWith(color: Colors.red),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.visibility)),
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
                validator: (value) {
                  String msg = '.{8,}';
                  if (value!.isEmpty) {
                    return 'Password can not be empty';
                  }
                  if (!RegExp(msg).hasMatch(value)) {
                    return 'Password length can’t be less than 8 char';
                  }
                  return null;
                },
                onSaved: (value) {},
                decoration: InputDecoration(
                    errorStyle: textStyle.copyWith(color: Colors.red),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.visibility)),
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
      ),
    );
  }
}
