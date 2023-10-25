// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginapp/Page/Home.dart';
import 'package:loginapp/data/Profile.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  Profile_user profile = Profile_user("", "");

  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(title: Text('Error ')),
              body: Center(child: Text('${snapshot.error}')),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                  title: Text(
                "RegisterPage",
                style: GoogleFonts.titanOne(fontSize: 18),
              )),
              backgroundColor: Color.fromARGB(255, 144, 229, 255),
              body: Container(
                  child: Form(
                key: formKey,
                child: Column(children: [
                  Image.asset(
                    "assets/img/steam-logo-transparent.png",
                    width: 200,
                    height: 100,
                  ),

                  SizedBox(height: 60),
                  Text(
                    "Register",
                    style: GoogleFonts.tiltNeon(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),

                  //
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
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
                        onSaved: (String? email) {
                          profile.email = email!;
                        },
                      ),
                    ),
                  ),
                  //space
                  SizedBox(
                    height: 5,
                  ),
                  //
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 231, 231, 231),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: TextFormField(
                        validator: RequiredValidator(
                            errorText: " Please Enter Your password"),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: ' Password',
                          hintStyle: GoogleFonts.tiltNeon(fontSize: 18),
                        ),
                        obscureText: true,
                        onSaved: (String? password) {
                          profile.password = password!;
                        },
                      ),
                    ),
                  ),

                  //
                  SizedBox(
                      child: ElevatedButton(
                    child: Text(
                      'Comfirm',
                      style: GoogleFonts.titanOne(
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () async {
                      //action
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: profile.email,
                                  password: profile.password)
                              .then((value) {
                            formKey.currentState!.reset();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                            Fluttertoast.showToast(
                              msg: "You're Created an account",
                              gravity: ToastGravity.CENTER,
                            );
                          });
                        } on FirebaseAuthException catch (e) {
                          // print(e.message);
                          // print(e.code);
                          Fluttertoast.showToast(
                            msg: e.message.toString(),
                            gravity: ToastGravity.CENTER,
                          );
                        }
                      }
                    },
                  ))

                  //

                  ,
                  SizedBox(
                    height: 230,
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

                  ///
                ]),
              )),
            );
          }
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
