import 'package:achat_app/pages/login_page.dart';
import 'package:achat_app/pages/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AchatApp());
}

class AchatApp extends StatelessWidget {
  const AchatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "LogInPage": (context) => LogInPage(),
        "SignUpPage": (context) => SignUpPage(),
      },
      initialRoute: "LogInPage",
    );
  }
}
