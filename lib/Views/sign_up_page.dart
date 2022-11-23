import 'package:flutter/material.dart';

import 'login_page.dart';

class SignUp1Page extends StatefulWidget {
  const SignUp1Page({Key? key}) : super(key: key);

  @override
  State<SignUp1Page> createState() => _SignUp1PageState();
}

class _SignUp1PageState extends State<SignUp1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign up",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
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
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  hintText: "Member ID",
                  labelText: "Member ID",
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.visibility)),
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            const SizedBox(
              height: 29.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.person,
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
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  hintText: "Phone Number",
                  labelText: "Phone Number",
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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 48,
              child: ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  child: const Text("LOGIN")),
            ),
            const SizedBox(
              height: 17.0,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
                },
                child: const Text(
                  "Already have an account? Log in here",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ))
          ],
        ),
      ),
    );
  }
}
