// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:achat_app/cubits/login_cubit/login_cubit.dart';
import 'package:achat_app/cubits/login_cubit/login_state.dart';
import 'package:achat_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:achat_app/constants.dart';
import 'package:achat_app/helpers/show_snack_bar.dart';
import 'package:achat_app/pages/chat_page.dart';
import 'package:achat_app/pages/signup_page.dart';
import 'package:achat_app/widgets/custom_button_widget.dart';
import 'package:achat_app/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class LogInPage extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  final String id = "LogInPage";
  bool isLoading = false;
  UserModel? user;
  String? email, password;

  LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          isLoading = true;
        } else if (state is LoginSuccessState) {
          isLoading = false;
          user = BlocProvider.of<LoginCubit>(context).userModel;
          Navigator.pushNamed(context, ChatPage().id, arguments: user);
        } else if (state is LoginFailureState) {
          isLoading = false;
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
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
                            "Sign In",
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
                        obscureText: true,
                      ),
                      CustomButton(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            BlocProvider.of<LoginCubit>(context)
                                .Login(email: email!, password: password!);
                          }
                        },
                        text: "Sign In",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "don`t have an account ",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, const SignUpPage().id);
                            },
                            child: const Text(
                              "Sign Up",
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
      },
    );
  }
}
