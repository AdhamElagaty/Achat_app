import 'dart:developer';
import 'package:achat_app/constants.dart';
import 'package:achat_app/helper/show_snack_bar.dart';
import 'package:achat_app/widgets/custom_button_widget.dart';
import 'package:achat_app/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  final String id = "SignUpPage";
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  String? email, password;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: kPrimeryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                    height: 300,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AChat",
                        style: TextStyle(
                            fontSize: 40,
                            fontFamily: "Pacifico",
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(224, 196, 195, 195)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  CustomTextFormField(
                    onSaveValue: (data) {
                      email = data;
                    },
                    hintText: "Email",
                  ),
                  CustomTextFormField(
                    onSaveValue: (data) {
                      password = data;
                    },
                    hintText: "Password",
                  ),
                  CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        isLoading = true;
                        setState(() {});
                        try {
                          await signUpUser();
                          showSnackBar(context, "Success.");
                        } on FirebaseAuthException catch (e) {
                          log(e.code);
                          if (e.code == 'weak-password') {
                            showSnackBar(context, "Weack password.");
                          } else if (e.code == 'email-already-in-use') {
                            showSnackBar(context, "Email already exists!");
                          } else {
                            showSnackBar(context, "Error!");
                          }
                        } catch (e) {
                          showSnackBar(context, "Error! Try later.");
                        }
                        isLoading = false;
                        setState(() {});
                      }
                    },
                    text: "Sign Up",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "already have account ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 175, 220, 255),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUpUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
