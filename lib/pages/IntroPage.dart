import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sneakerapp/pages/login_page.dart';

import 'homepage.dart';

class introPage extends StatefulWidget {
  const introPage({Key? key}) : super(key: key);

  @override
  State<introPage> createState() => _introPageState();
}

class _introPageState extends State<introPage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }
  navigateToHome()async{
    await Future.delayed(const Duration(milliseconds: 4000),(){});
    if(user==null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage()));
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //  logo
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Image.asset(
                  'lib/images/nike.png',
                  height: 200,
                ),
              ),
              //  title
              const Text(
                "Just do it",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 24,
              ),
              //  subtitle
              const Text(
                "Custom kicks made with premium quality",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
