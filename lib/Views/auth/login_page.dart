import 'package:flutter/material.dart';
import 'package:hms_16/Views/auth/forgot_password_page2.dart';
import 'package:hms_16/Views/auth/forgot_password_page3.dart';
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
  late String email, password;

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late final TextStyle? errorStyle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 220,
              ),
              Center(
                child: Text(
                  "Sign In",
                  style: textStyle.copyWith(
                      color: cBlackBase,
                      fontSize: 34,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 40,
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
              const SizedBox(
                height: 12.0,
              ),
              Row(
                children: [
                  Text(
                    "Password ",
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
                controller: controllerPassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please a Enter Password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: cSuccessBase,
                        )),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.visibility)),
                    hintText: ("Password"),
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              ),
              const SizedBox(
                height: 26.0,
              ),
              Button(
                  text: "Sign In",
                  onpressed: () {
                    navPushTransition(context, const SignUpPage());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ));
                  }),
              const SizedBox(
                height: 15.0,
              ),
              TextButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   print("successful");
                    //   return;
                    // } else {
                    //   print("UnSuccessfull");
                    // }
                    navPushTransition(context, const ForgotPassword1());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPassword1(),
                        ));
                  },
                  child: Center(
                    child: Text(
                      "Forgot Password?",
                      style: textStyle.copyWith(
                          color: cPrimaryBase,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
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
