import 'package:achat_app/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AchatApp());
}

class AchatApp extends StatelessWidget {
  const AchatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
