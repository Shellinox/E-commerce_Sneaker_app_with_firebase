import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sneakerapp/pages/homepage.dart';
import 'package:sneakerapp/pages/sign_up_page.dart';

import '../components/Toast_message.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool loading = false;

  void login() {
    setState(() {
      loading = true;
    });
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: email.text.toString(), password: password.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Homepage()));
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset(
              "lib/images/loginLogo.png",
              height: 250,
            ),
            TextField(
              decoration: InputDecoration(
                label: Text(
                  "Email",
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
              ),
              controller: email,
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                label: Text(
                  "Password",
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
              ),
              controller: password,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                login();
              },
              child: Container(
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: loading
                      ? const SizedBox(
                    height: 20,
                    width: 20,
                        child: CircularProgressIndicator(
                            color: Colors.white,
                    strokeWidth: 2,
                          ),
                      )
                      : const Text(
                          "Login",
                          style: (TextStyle(color: Colors.white)),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    child: GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp())),
                  child: const Text(
                    "Sign up",
                    style: (TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold)),
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
