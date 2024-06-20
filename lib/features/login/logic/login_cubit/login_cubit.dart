import 'package:aflami/core/helpers/cache_helper.dart';
import 'package:aflami/core/helpers/cahce_keys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Icon suffix = const Icon(Icons.visibility_outlined,color: Colors.white,);
  bool isObscurePassword = true;
  void changePasswordVisibility() {
    isObscurePassword = !isObscurePassword;
    suffix = isObscurePassword
        ? const Icon(Icons.visibility_outlined,color: Colors.white)
        : const Icon(Icons.visibility_off_outlined,color: Colors.white);
    emit(LoginChangePasswordVisibilityState());
  }

  Future<void> login() async {
    emit(LoginLoadingState());
    try {
      var credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      CacheHelper.saveData(key: CacheKeys.loginKey,value: true);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailureState(errorMessage: mapFirebaseAuthException(e)));
    } catch (e) {
      emit(LoginFailureState(errorMessage: e.toString()));
    }
  }

  String mapFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'The email address is not registered.';
      case 'wrong-password':
        return 'The password is incorrect.';
      case 'invalid-email':
        return 'The email address is invalid.';
      case 'user-disabled':
        return 'The user account has been disabled.';
      case 'too-many-requests':
        return 'Too many login attempts. Please try again later.';
      case 'operation-not-allowed':
        return 'Email/password sign-in is disabled.';
      default:
        return 'An error occurred during login (${e.code}).';
    }
  }
}
