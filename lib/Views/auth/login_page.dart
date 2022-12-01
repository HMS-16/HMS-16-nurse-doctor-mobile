import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/views/auth/forgot_password_page1.dart';
import 'package:hms_16/views/auth/sign_up_page.dart';
import 'package:hms_16/widget/button.dart';
import 'package:hms_16/widget/navpush_transition.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 170,
              ),
              Text(
                "Sign In",
                style: textStyle.copyWith(
                    color: cBlackBase,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 56,
              ),
              TextFormField(
                controller: controllerEmail,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.black,
                    ),
                    hintText: "Email",
                    labelText: "Email",
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              ),
              const SizedBox(
                height: 34.0,
              ),
              TextFormField(
                controller: controllerPassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: Icon(Icons.visibility)),
                    hintText: "Password",
                    labelText: "Password",
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              ),
              SizedBox(
                height: 26.0,
              ),
              Button(
                  text: "Sign In",
                  onpressed: () {
                    navPushTransition(context, SignUpPage());
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const SignUpPage(),
                    //     ));
                  }),
              SizedBox(
                height: 15.0,
              ),
              TextButton(
                  onPressed: () {
                    navPushTransition(context, const ForgotPassword1());
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const ForgotPassword1(),
                    //     ));
                  },
                  child: Text(
                    "Forgot Password?",
                    style: textStyle.copyWith(
                        color: cPrimaryBase,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  )),
              const SizedBox(
                height: 63.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
