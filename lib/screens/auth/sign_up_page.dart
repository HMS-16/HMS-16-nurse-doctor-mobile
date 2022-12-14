import 'package:flutter/material.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/screens/navbar/navbar.dart';
import 'package:hms_16/widget/button.dart';
import 'package:hms_16/widget/navpush_transition.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String email, password;

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerRegNum = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerSecPassword = TextEditingController();

  bool _hidePassword = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    List<String> listRole = ["Doctor", "Nurse"];
    String valueRole = listRole.first;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Register New User",
                    style: textStyle.copyWith(
                        color: cBlackBase,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text(
                      "User ",
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
                  controller: controllerUser,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Name can not be empty';
                    }
                    if (!RegExp(r'^[aA-zZ]+$').hasMatch(value)) {
                      return 'Name is invalid';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: cBlackBase,
                      ),
                      hintText: "Name",
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  children: [
                    Text(
                      "Registration Number ",
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
                  controller: controllerRegNum,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Registration Number can not be empty';
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Registration Number is Invalid';
                    }
                    if (!RegExp('.{8,}').hasMatch(value)) {
                      return 'Registration Number length must be 8 char';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(
                        Icons.verified_user,
                        color: cBlackBase,
                      ),
                      hintText: "Registration Number",
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "Role ",
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
                DropdownButtonFormField<String>(
                  // dropdownColor: Colors.red,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.supervised_user_circle,
                        color: cBlackBase,
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  isExpanded: true,
                  value: valueRole,
                  validator: (value) {
                    if (valueRole.isEmpty) {
                      return 'Role can not be empty';
                    }
                  },
                  elevation: 0,
                  borderRadius: BorderRadius.circular(12),
                  style: textStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w400),
                  onChanged: (value) {
                    setState(() {
                      valueRole = value!;
                    });
                  },
                  items: listRole
                      .map<DropdownMenuItem<String>>(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e,
                              style: textStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: cBlackLighter)),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(
                  height: 12.0,
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
                  // obscureText: !_hidePassword,
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
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: cBlackBase,
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
                  obscureText: !_hidePassword,
                  controller: controllerPassword,
                  validator: (value) {
                    String msg = '.{8,}';
                    if (value!.isEmpty) {
                      return 'Password must be filled';
                    }
                    if (!RegExp(msg).hasMatch(value)) {
                      return 'Password length can’t be less than 8 char';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: cBlackBase,
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
                  height: 12.0,
                ),
                Row(
                  children: [
                    Text(
                      "Confirm Password ",
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
                  obscureText: !_hidePassword,
                  controller: controllerSecPassword,
                  validator: (value) {
                    String msg = '.{8,}';
                    if (value!.isEmpty) {
                      return 'Password must be filled';
                    }
                    if (!RegExp(msg).hasMatch(value)) {
                      return 'Password length can’t be less than 8 char';
                    }
                    if (controllerSecPassword.text != controllerPassword.text) {
                      return 'Password not same';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: cBlackBase,
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
                      hintText: ("Confirm Password"),
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                ),
                const SizedBox(
                  height: 34.0,
                ),
                Button(
                    text: "Register",
                    onpressed: () {
                      // if (_formKey.currentState!.validate()) {
                      navPushTransition(context, const NavBar());
                      // }
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const NavBar(),
                      //     ));
                    }),
                const SizedBox(
                  height: 17.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
