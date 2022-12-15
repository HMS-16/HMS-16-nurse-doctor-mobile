import 'package:flutter/material.dart';
import 'package:hms_16/screens/auth/login_page.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/view_model/auth_view_model.dart';
import 'package:hms_16/view_model/general_view_model.dart';
import 'package:hms_16/widget/button.dart';
import 'package:hms_16/model/register_model.dart';
import 'package:hms_16/widget/dialog_validation.dart';
import 'package:hms_16/widget/navreplace_transition.dart';
import 'package:hms_16/widget/status/loading_max.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

List<String> listRole = ["Doctor", "Nurse"];

String valueRole = "Choose role";

class _SignUpPageState extends State<SignUpPage> {
  late String email, password;
  String msgPassword = '.{5,}';

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerRegNum = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerSecPassword = TextEditingController();

  bool _hidePassword = false;
  bool _hideConfirmPassword = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                      "Name",
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
                    if (!RegExp(r'^.{16}$').hasMatch(value)) {
                      return 'Registration Number length must be 16 digit';
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
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  isExpanded: true,
                  // value: valueRole,
                  hint: Text(valueRole),
                  validator: (value) {
                    if (valueRole == "Choose role") {
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
                    // String msg = '.{8,}';
                    if (value!.isEmpty) {
                      return 'Password must be filled';
                    }
                    if (!RegExp(msgPassword).hasMatch(value)) {
                      return 'Password length can’t be less than 5 char';
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
                  obscureText: !_hideConfirmPassword,
                  controller: controllerSecPassword,
                  validator: (value) {
                    // String msg = '.{5,}';
                    if (value!.isEmpty) {
                      return 'Confirm password must be filled';
                    }
                    if (!RegExp(msgPassword).hasMatch(value)) {
                      return 'Confirm password length can’t be less than 5 char';
                    }
                    if (controllerSecPassword.text != controllerPassword.text) {
                      return 'Confirm password doesn’t match';
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
                          _hideConfirmPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          setState(() {
                            _hideConfirmPassword = !_hideConfirmPassword;
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
                  child: Consumer<GeneralViewModel>(
                    builder: (context, value, child) {
                      switch (value.state) {
                        case ActionState.none:
                          return Text('Register');
                        case ActionState.loading:
                          return LoadingMax();
                        default:
                          return Text('Register');
                        // case ActionState.error:
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(content: Text("email or password is invalid")),
                        //   );
                      }
                    },
                  ),
                  // child: Text("Register"),
                  onpressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // navReplaceTransition(context, const NavBar());
                      // var viewModel = Provider.of<RegisterViewModel>(context,
                      //     listen: false);

                      var data = Datum(
                        username: controllerUser.text,
                        password: controllerPassword.text,
                        email: controllerEmail.text,
                        strNum: controllerRegNum.text,
                        // phoneNum: controllerRegNum.text,
                        role: listRole.indexOf(valueRole) + 1,
                      );

                      context.read<AuthViewModel>().register(
                            data,
                            context.read<AuthViewModel>().tokenBearer!,
                            context,
                          );
                    } else {
                      print("error");
                    }
                  },
                ),
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
