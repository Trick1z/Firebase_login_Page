// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginapp/Page/Login.dart';
import 'package:loginapp/Page/Register.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Register & Login",
        style: GoogleFonts.titanOne(fontSize: 18),
      )),
      backgroundColor: Color.fromARGB(255, 144, 229, 255),
      //// Steam Icon
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Image.asset("assets/img/steam-logo-transparent.png"),

            //Login_button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //go to
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  'Login',
                  style:
                      GoogleFonts.titanOne(fontSize: 20, color: Colors.black),
                ),
              ),
            ),

            //Register_button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //go to
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text(
                  'Register',
                  style:
                      GoogleFonts.titanOne(fontSize: 20, color: Colors.black),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
