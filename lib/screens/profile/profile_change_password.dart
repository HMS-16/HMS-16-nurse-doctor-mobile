import 'package:flutter/material.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/view_model/auth_view_model.dart';
import 'package:hms_16/widget/dialog_validation.dart';
import 'package:hms_16/widget/duration_dialog.dart';
import 'package:provider/provider.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final lastpasscontrol = TextEditingController();
  final newpasscontrol = TextEditingController();
  final cnewpasscontrol = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: cBlack),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Change Password',
          style: textStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 5, 0),
                child: Row(
                  children: [
                    Text(
                      "Last Password ",
                      style:
                          textStyle.copyWith(color: cBlackBase, fontSize: 14),
                    ),
                    Text(
                      "*",
                      style: textStyle.copyWith(color: cRed, fontSize: 14),
                    ),
                  ],
                ),
              ),
              BuildPassField(
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return ("Password can not be empty");
                  } else {
                    return null;
                  }
                },
                controller: lastpasscontrol,
                hint: "Enter your last password",
              ),
              InkWell(
                onTap: () {
                  dialogValidation(
                    context: context,
                    title: "Coming Soon!",
                    isValidation: false,
                    isImage: false,
                    newPage: () async {
                      await Future.delayed(Duration(seconds: 2), () {
                        Navigator.pop(context);
                      });
                    },
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  alignment: Alignment.center,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.blue),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 5, 0),
                child: Text(
                  "Create New Password",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 5, 0),
                child: Row(
                  children: [
                    Text(
                      "New Password ",
                      style:
                          textStyle.copyWith(color: cBlackBase, fontSize: 14),
                    ),
                    Text(
                      "*",
                      style: textStyle.copyWith(color: cRed, fontSize: 14),
                    ),
                  ],
                ),
              ),
              BuildPassField(
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return ("New password can not be empty");
                  } else if (p0.characters.length < 8) {
                    return ("Password length can not be less than 8 character");
                  } else {
                    return null;
                  }
                },
                controller: newpasscontrol,
                hint: "Create New password",
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 5, 0),
                child: Row(
                  children: [
                    Text(
                      "Confirm New Password ",
                      style:
                          textStyle.copyWith(color: cBlackBase, fontSize: 14),
                    ),
                    Text(
                      "*",
                      style: textStyle.copyWith(color: cRed, fontSize: 14),
                    ),
                  ],
                ),
              ),
              BuildPassField(
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return ("Confirm new password can not be empty");
                  }
                  if (cnewpasscontrol.text != newpasscontrol.text) {
                    return ("Confirm new password does not match");
                  }
                  return null;
                },
                controller: cnewpasscontrol,
                hint: "Confirm New password",
              ),
              Consumer<AuthViewModel>(
                builder: (context, value, child) {
                  return Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.only(top: 30),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: cPrimaryBase,
                            minimumSize:
                                Size(MediaQuery.of(context).size.width, 50)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await showDialog<void>(
                              context: context,
                              builder: (context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                title: Text("Confirm To Change Password ?"),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              backgroundColor: cPrimaryBase,
                                              minimumSize: Size(130, 50)),
                                          onPressed: () async {
                                            durationDialog(context,
                                                "Password Changed Successfully!");
                                            Future.delayed(
                                                const Duration(seconds: 2), () {
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Text("Yes")),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              side: BorderSide(
                                                  color: cPrimaryBase),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              backgroundColor: Colors.white,
                                              minimumSize: Size(130, 50)),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "No",
                                            style:
                                                TextStyle(color: Colors.black),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: Text("Send")),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BuildPassField extends StatefulWidget {
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  BuildPassField({
    Key? key,
    required this.hint,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  State<BuildPassField> createState() => _BuildPassFieldState();
}

class _BuildPassFieldState extends State<BuildPassField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: obscureText,
        validator: widget.validator,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: widget.hint,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
          ),
          prefixIcon: Icon(
            Icons.lock,
            color: cBlack,
          ),
        ),
      ),
    );
  }
}
