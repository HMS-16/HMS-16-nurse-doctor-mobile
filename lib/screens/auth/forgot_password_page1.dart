import 'package:flutter/material.dart';
import 'package:hms_16/screens/auth/forgot_password_page2.dart';
import 'package:hms_16/utils/constant.dart';
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
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Center(
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
              const SizedBox(height: 30),
              Center(
                child: Text(
                  "Please Enter Your Email Address",
                  style: textStyle.copyWith(
                      color: cBlackBase,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 30),
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
                  String msg =
                      r"[a-z0-9!#%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$";
                  if (value!.isEmpty) {
                    return 'Email can not be empty';
                  }
                  if (!RegExp(msg).hasMatch(value)) {
                    return 'Email is invalid';
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
                        borderSide:
                            BorderSide(color: cSuccessBase, width: 5.0)),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.black,
                    ),
                    hintText: "Email",
                    floatingLabelBehavior: FloatingLabelBehavior.auto),
              ),
              Button(
                child: Text("Send"),
                bgcolor: Colors.blueAccent,
                margin: const EdgeInsets.only(top: 30),
                onpressed: () {
                  FocusManager.instance.primaryFocus!.unfocus();
                  navPushTransition(context, const ForgotPassword2());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
