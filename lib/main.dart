import 'package:achat_app/cubits/login_cubit/login_cubit.dart';
import 'package:achat_app/firebase_options.dart';
import 'package:achat_app/pages/chat_page.dart';
import 'package:achat_app/pages/login_page.dart';
import 'package:achat_app/pages/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LogInPage().id: (context) => LogInPage(),
          const SignUpPage().id: (context) => const SignUpPage(),
          ChatPage().id: (context) => ChatPage(),
        },
        initialRoute: LogInPage().id,
      ),
    );
  }
}
