import 'package:flutter/material.dart';
import 'package:hms_16/screens/auth/forgot_password_page2.dart';
import 'package:hms_16/screens/auth/forgot_password_page3.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/screens/auth/forgot_password_page1.dart';
import 'package:hms_16/screens/auth/sign_up_page.dart';
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

  bool _hidePassword = false;
  final formKey = GlobalKey<FormState>();
  late final TextStyle? errorStyle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      style:
                          textStyle.copyWith(color: cBlackBase, fontSize: 14),
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
                    String msg =
                        r"[a-z0-9!#%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$";
                    if (value!.isEmpty) {
                      return 'Email can not be empty';
                    }
                    if (!RegExp(msg).hasMatch(value)) {
                      return 'Email is invalid';
                    }
                    // return null;
                  },
                  // onSaved: (value) {
                  //   email = value!;
                  // },
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
                      style:
                          textStyle.copyWith(color: cBlackBase, fontSize: 14),
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
                  obscureText: !_hidePassword,
                  validator: (value) {
                    String msg = '.{8,}';
                    if (value!.isEmpty) {
                      return 'Password can not be empty';
                    }
                    if (!RegExp(msg).hasMatch(value)) {
                      return 'Password length can’t be less than 8 char';
                    }
                    // return null;
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
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _hidePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          setState(() {
                            _hidePassword = !_hidePassword;
                          });
                        },
                      ),
                      hintText: ("Password"),
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                ),
                const SizedBox(
                  height: 26.0,
                ),
                Button(
                  text: "Sign In",
                  onpressed: () {
                    // if (formKey.currentState!.validate()) {
                    //   email = controllerEmail.text;
                    //   password = controllerPassword.text;
                    //   debugPrint(email);
                    //   debugPrint(password);
                      navPushTransition(context, const SignUpPage());
                    // }
                    // if (!_formKey.currentState!.validate()) {
                    //   ScaffoldMessenger.of(context)
                    //       .showSnackBar(SnackBar(content: Text("Success")));
                    // } else {
                    //   ScaffoldMessenger.of(context)
                    //       .showSnackBar(SnackBar(content: Text("Failled")));
                    // }
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextButton(
                    onPressed: () {
                      navPushTransition(context, const ForgotPassword1());
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
      ),
    );
  }
}
