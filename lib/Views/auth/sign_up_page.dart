import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/views/navbar/navbar.dart';
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
  TextEditingController controllerPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  return 'Please a Enter Name';
                }
                return null;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(
                    Icons.verified_user,
                    color: Colors.black,
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
                  return 'Please a Enter Number';
                }
                return null;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(
                    Icons.verified_user,
                    color: Colors.black,
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
                  return 'Please a Enter Role';
                }
                return null;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(
                    Icons.supervised_user_circle,
                    color: Colors.black,
                  ),
                  hintText: "Role",
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            const SizedBox(
              height: 12.0,
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
                  ),
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
              height: 12.0,
            ),
            Row(
              children: [
                Text(
                  "Confirm Password ",
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
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.visibility)),
                  hintText: ("Confirm Password"),
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            const SizedBox(
              height: 34.0,
            ),
            Button(
                text: "Register",
                onpressed: () {
                  navPushTransition(context, NavBar());
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => NavBar(),
                  //     ));
                }),
            const SizedBox(
              height: 17.0,
            ),
          ],
        ),
      ),
    );
  }
}
