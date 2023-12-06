import 'package:achat_app/firebase_options.dart';
import 'package:achat_app/pages/login_page.dart';
import 'package:achat_app/pages/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AchatApp());
}

class AchatApp extends StatelessWidget {
  const AchatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // ignore_for_file: prefer_const_constructors
        const LogInPage().id: (context) => LogInPage(),
        const SignUpPage().id: (context) => SignUpPage(),
      },
      initialRoute: "LogInPage",
    );
  }
}
