import 'package:flutter/material.dart';
import 'package:hms_16/views/navbar/navbar.dart';
import 'package:hms_16/widget/button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Registration New User",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 44.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  hintText: "Name",
                  labelText: "Name",
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            const SizedBox(
              height: 29.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.shield_rounded,
                    color: Colors.black,
                  ),
                  hintText: "Registration Number",
                  labelText: "Registration Number",
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            const SizedBox(
              height: 29.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  hintText: "Email",
                  labelText: "Email",
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            const SizedBox(
              height: 29.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  hintText: "Password",
                  labelText: "Password",
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.visibility)),
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            const SizedBox(
              height: 29.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  hintText: "Confirm Password",
                  labelText: "Confirm Password",
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.visibility)),
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            const SizedBox(
              height: 34.0,
            ),
            Button(
                text: "Register",
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavBar(),
                      ));
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
