import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_grow/features/authentication/model/registration_model.dart';
import 'package:skill_grow/features/authentication/service/registration_service.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import '../../../core/widgets/snackbar.dart';

class RegistrationController extends GetxController {
  // Form key for validation
  final formKey = GlobalKey<FormState>();

  // Text editing controllers for form fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Loading state
  var isLoading = false.obs;

  // Name validation
  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return translatedText('Please enter your name');
    }
    if (value.length < 3) {
      return translatedText('Name must be at least 3 characters long');
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return translatedText('Name can only contain letters and spaces');
    }
    return null;
  }

  // Email validation
  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return translatedText('Please enter your email');
    }
    String pattern = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,7}\b';
    if (!RegExp(pattern).hasMatch(value)) {
      return translatedText('Please enter a valid email address');
    }
    return null;
  }

  // Password validation
  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return translatedText('Please enter your password');
    }
    if (value.length < 4) {
      return translatedText('Password must be at least 4 characters long');
    }
    // if (!RegExp(r'[A-Z]').hasMatch(value)) {
    //   return translatedText(
    //       'Password must contain at least one uppercase letter');
    // }
    // if (!RegExp(r'[0-9]').hasMatch(value)) {
    //   return translatedText('Password must contain at least one number');
    // }
    return null;
  }

  // Confirm password validation
  String? validateConfirmPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return translatedText('Please confirm your password');
    }
    if (value != passwordController.text.trim()) {
      return translatedText('Passwords do not match');
    }
    return null;
  }

  // Function to handle registration form submission
  Future<void> register() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;

      try {
        // Prepare the login request model
        final requestModel = RegistrationRequestModel(
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          password_confirmation: confirmPasswordController.text.trim(),
        );

        // Call login service to register
        final response = await RegistrationService().register(requestModel);

        // Handle response
        if (response.status == 'success') {
          customSnackbar(
            title: "Success",
            message: response.message.toString(),
            type: CustomSnackbarType.success,
          );
          // Navigate to the home page or dashboard after successful registration
          // You can use Get.to(HomePage()) or Get.offAll(HomePage()) here
        } else {}

        // Clear form fields after submission
        nameController.clear();
        emailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
      } catch (e) {
        // Log any error that occurs
        log(e.toString());
      } finally {
        // Ensure loading state is turned off
        isLoading.value = false;
      }
    } else {
      // If form is invalid, show error message
    }
  }
}
