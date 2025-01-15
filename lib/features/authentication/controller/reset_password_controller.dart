import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_grow/features/authentication/model/reset_password_model.dart';
import 'package:skill_grow/features/authentication/service/reset_password_service.dart';
import 'package:skill_grow/features/authentication/view/login_view.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import '../../../core/widgets/snackbar.dart';

class ResetPasswordController extends GetxController {
  // Form key
  final formKey = GlobalKey<FormState>();

  // Text controllers
  final TextEditingController forgetPasswordTokenController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // State management
  var isLoading = false.obs;

  // Email validation
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return translatedText('Please enter your email');
    }
    String pattern = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,7}\b';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return translatedText('Please enter a valid email address');
    }
    return null;
  }

  // Password validation
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return translatedText('Please enter your password');
    }

    if (value.length < 4) {
      return translatedText('Password must be at least 4 characters long');
    }
    return null;
  }

  // Password validation
  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return translatedText('Please enter your password');
    }

    if (value.trim().toString() != passwordController.text.trim().toString()) {
      return translatedText('Passwords do not match');
    }
    return null;
  }

  String? validateToken(String? value) {
    if (value == null || value.isEmpty) {
      return translatedText('Please enter your forget password token');
    }
    return null;
  }

  // Login function
  Future<void> resetPassword() async {
    isLoading.value = true;
    try {
      final requestModel = ResetPasswordRequestModel(
        token: forgetPasswordTokenController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim(),
      );

      final response = await ResetPasswordService().resetPassword(requestModel);

      if (response.status == 'success') {
        // Handle success, navigate to home
        customSnackbar(
            title: "Success",
            message: response.message.toString(),
            type: CustomSnackbarType.success);
      }
      emailController.clear();
      forgetPasswordTokenController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
       Navigator.pushAndRemoveUntil(
          Get.context!,
          MaterialPageRoute(
              builder: (context) =>
                  LoginView()), (route) => false); // Get.toNamed('/resetPassword', route)
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
