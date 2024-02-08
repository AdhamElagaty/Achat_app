import 'dart:developer';
import 'package:achat_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<UserModel> LogIn(
      {required String email, required String password}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      UserModel userModel = UserModel(user: user);
      return userModel;
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      log("Error! From LoginService(Login) is:$e");
      if (e.code == "invalid-credential") {
        errorMessage = "Invalid email or password!";
      } else if (e.code == "wrong-password") {
        errorMessage = "Invalid password!";
      } else if (e.code == "user-not-found") {
        errorMessage = "No account with this email!";
      } else if (e.code == "invalid-email") {
        errorMessage = "Invalid email!";
      } else {
        errorMessage = "Something went Error! Try later";
      }
      throw (errorMessage);
    } catch (e) {
      log("Error! From AuthService(Login) is:$e");
      throw ("Something went Error! Try later");
    }
  }

  Future<void> SignUp({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      log("Error! From LoginService(SignUp) is:$e");
      if (e.code == 'weak-password') {
        errorMessage = "Weack password.";
      } else if (e.code == 'email-already-in-use') {
        errorMessage = "Email already exists!";
      } else {
        errorMessage = "Something went Error! Try later";
      }
      throw (errorMessage);
    } catch (e) {
      log("Error! From AuthService(SignUp) is:$e");
      throw ("Something went Error! Try later");
    }
  }
}
