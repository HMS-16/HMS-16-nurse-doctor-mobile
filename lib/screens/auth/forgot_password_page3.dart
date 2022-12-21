import 'package:flutter/material.dart';
import 'package:hms_16/screens/auth/login_page.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/widget/button.dart';
import 'package:hms_16/widget/navpush_transition.dart';

class ForgotPassword3 extends StatefulWidget {
  const ForgotPassword3({super.key});

  @override
  State<ForgotPassword3> createState() => _ForgotPassword3State();
}

class _ForgotPassword3State extends State<ForgotPassword3> {
  @override
  Widget build(BuildContext context) {
    late String password;
    TextEditingController controllerPassword = TextEditingController();

    bool _hidePassword = false;
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
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage(
                  "assets/images/forgot-password.png",
                ),
                fit: BoxFit.contain,
                width: double.maxFinite,
                height: 220,
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "Create your new password",
                  style: textStyle.copyWith(
                    color: cBlackBase,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
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
                obscureText: !_hidePassword,
                // controller: controllerPassword,
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
                // onSaved: (value) {},
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
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _hidePassword ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      setState(() {
                        _hidePassword = !_hidePassword;
                      });
                    },
                  ),
                  hintText: "Create Password",
                  // floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
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
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _hidePassword ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      setState(() {
                        _hidePassword = !_hidePassword;
                      });
                    },
                  ),
                  hintText: "Confirm New Password",
                  // floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Button(
                child: Text("SAVE"),
                bgcolor: Colors.blueAccent,
                margin: const EdgeInsets.only(top: 30),
                onpressed: () {
                  navReplaceTransition(context, const LoginPage());
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const LoginPage(),
                  //   ),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
