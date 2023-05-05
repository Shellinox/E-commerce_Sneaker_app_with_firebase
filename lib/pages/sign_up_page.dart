import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakerapp/pages/homepage.dart';
import 'package:sneakerapp/pages/shoppage.dart';

import '../components/Toast_message.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  final emailSignup = TextEditingController();
  final passwordSignup = TextEditingController();
  bool loading = false;
  late Utils utils;

  void signUp() {
    setState(() {
      loading = true;
    });
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailSignup.text.toString(),
            password: passwordSignup.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
      Utils.toastMessage("Sign up successful");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Homepage()));
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
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
              controller: emailSignup,
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
              controller: passwordSignup,
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              controller: passwordSignup,
              decoration: InputDecoration(
                label: Text(
                  "Confirm password",
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                signUp();
              },
              child: Container(
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(5)),
                child:  Center(
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
                          "Sign up",
                          style: (TextStyle(color: Colors.white)),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
