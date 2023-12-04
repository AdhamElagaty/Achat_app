import 'package:achat_app/widgets/custom_button_widget.dart';
import 'package:achat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xFF274460),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              Image.asset(
                "assets/images/logo.png",
                height: 300,
              ),
              const Text(
                "AChat",
                style: TextStyle(
                    fontSize: 40,
                    fontFamily: "Pacifico",
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(224, 196, 195, 195)),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CustomTextField(
                hintText: "Email",
              ),
              const CustomTextField(
                hintText: "Password",
              ),
              const CustomButton(text: "Sign In"),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "don`t have an account ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 175, 220, 255),
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
