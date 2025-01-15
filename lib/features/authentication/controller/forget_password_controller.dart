import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_grow/features/authentication/model/forget_password_model.dart';
import 'package:skill_grow/features/authentication/service/forget_password_service.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import '../../../core/widgets/snackbar.dart';
import '../view/reset_password_view.dart';

class ForgetPasswordController extends GetxController {
  // Form key
  final formKey = GlobalKey<FormState>();

  // Text controllers
  final TextEditingController emailController = TextEditingController();

  // State management
  var isLoading = false.obs;

  // Email validation
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    String pattern = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,7}\b';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return translatedText('Please enter a valid email address');
    }
    return null;
  }

  // Password validation

  // Login function
  Future<void> forgetPassword() async {
    isLoading.value = true;
    try {
      final requestModel = ForgetPasswordRequestModel(
        email: emailController.text.trim(),
      );

      final response =
          await ForgetPasswordService().forgetPassword(requestModel);

      if (response.status == 'success') {
        // Handle success, navigate to home
        customSnackbar(
            title: "Success",
            message: response.message.toString(),
            type: CustomSnackbarType.success);
      }
      emailController.clear();
      Get.to(()=> ResetPasswordView());
     
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
