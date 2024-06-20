import 'dart:async';
import 'package:aflami/core/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final  formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  TextEditingController passwordController = TextEditingController();
  XFile? pickedImage;
  bool isChecked = false;

  Icon suffix = const Icon(Icons.visibility_outlined,color: Colors.white,);
  bool isObscurePassword = true;
  void changePasswordVisibility() {
    isObscurePassword = !isObscurePassword;
    suffix = isObscurePassword
        ? const Icon(Icons.visibility_outlined,color: Colors.white)
        : const Icon(Icons.visibility_off_outlined,color: Colors.white);
    emit(ChangePasswordVisibilityState());
  }

  Future<void> pickProfileImage() async {
    final imagePicker = ImagePicker();
    pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      emit(RegisterPickedImageState(imagePath: pickedImage?.path??'assets/images/profile 7.png'));
    } else {
      emit(const RegisterPickedImageFailureState(
          errorMessage: 'Image selection cancelled.'));
    }
  }

  updateCheckBox(bool value) {
    isChecked = value;
    emit(RegisterCheckBoxState(isChecked: value));
  }

  Future<void> register() async {
    if (!isChecked) {
      emit(const RegisterCheckBoxFalseState(
          errorMessage: 'You need to accept the terms and conditions'));
      return;
    }
    emit(RegisterLoadingState());

    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      UserModel userModel = UserModel(
          name: nameController.text,
          email: emailController.text,
          profileImage: pickedImage?.path ?? 'assets/images/profile 7.png');

      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set(userModel.toMap());
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(RegisterFailureState(errorMessage: mapFirebaseAuthException(e)));
    } catch (e) {
      emit(RegisterFailureState(errorMessage: e.toString()));
    }
  }

  String mapFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'invalid-email':
        return 'The email address is invalid.';
      case 'operation-not-allowed':
        return 'Email/password sign-in is disabled.';
      case 'user-deleted':
        return 'The user account has been deleted.';

      default:
        return 'An error occurred during registration (${e.code}).';
    }
  }
}
