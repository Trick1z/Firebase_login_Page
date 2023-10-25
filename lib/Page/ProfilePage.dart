// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginapp/Page/Home.dart';
import 'package:loginapp/data/Profile.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome")),
      backgroundColor: Color.fromARGB(255, 144, 229, 255),
      body: Column(children: [
        SizedBox(
          height: 30,
        ),
        Center(
          child: Text(
            "Welcome , ${auth.currentUser?.email} ",
            style:
                GoogleFonts.tiltNeon(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              });
            },
            child: Text("Logout"))
      ]),
    );
  }
}
