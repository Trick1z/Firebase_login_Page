import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginapp/Page/Home.dart';
import 'package:loginapp/data/Profile.dart';

class ResetpassPage extends StatefulWidget {
  const ResetpassPage({super.key});

  @override
  State<ResetpassPage> createState() => _ResetpassPageState();
}

class _ResetpassPageState extends State<ResetpassPage> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome")),
      backgroundColor: Color.fromARGB(255, 144, 229, 255),
      body: Column(children: [
        SizedBox(
          height: 30,
        ),
        Text('Enter your email we\'ll send resetlink to your email'),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 231, 231, 231),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(11),
            ),
            child: TextFormField(
              validator: MultiValidator([
                RequiredValidator(errorText: "Enter your email"),
                EmailValidator(errorText: "Email not correct"),
              ]),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: ' Username',
                hintStyle: GoogleFonts.tiltNeon(fontSize: 18),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {},
            child: Text(
              "Send",
              style: GoogleFonts.tiltNeon(fontSize: 18),
            )),
        SizedBox(
          height: 120,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Text(
            "HOME",
            style: GoogleFonts.tiltNeon(
                decoration: TextDecoration.underline,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 2, 114, 189)),
          ),
        ),
      ]),
    );
  }
}
