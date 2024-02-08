import 'dart:developer';

import 'package:achat_app/cubits/login_cubit/login_state.dart';
import 'package:achat_app/models/user_model.dart';
import 'package:achat_app/services/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  UserModel? userModel;
  Future<void> Login({required String email, required String password}) async {
    try {
      emit(LoginLoadingState());
      userModel = await AuthService().LogIn(email: email, password: password);
      emit(LoginSuccessState());
    } catch (e) {
      log(e.toString());
      emit(LoginFailureState(errorMessage: e.toString()));
    }
  }
}
