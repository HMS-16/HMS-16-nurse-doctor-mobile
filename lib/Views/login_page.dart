import 'package:hms_16/Views/forgot_password_page1.dart';
import 'package:hms_16/Views/sign_up_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Log in",
              style: TextStyle(color: Colors.black, fontSize: 32),
            ),
            const SizedBox(
              height: 56,
            ),
            TextFormField(
              controller: controllerEmail,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                  ),
                  hintText: "Email",
                  labelText: "Email",
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            const SizedBox(
              height: 34.0,
            ),
            TextFormField(
              controller: controllerEmail,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(
                    Icons.password_outlined,
                    color: Colors.black,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: Icon(Icons.visibility)),
                  hintText: "Password",
                  labelText: "Password",
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            const SizedBox(
              height: 26.0,
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
              height: 26.0,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPassword1(),
                      ));
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                )),
            const SizedBox(
              height: 63.0,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUp1Page(),
                      ));
                },
                child: const Text(
                  "Don't have an account? Sign up here",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ))
          ],
        ),
      ),
    );
  }
}
