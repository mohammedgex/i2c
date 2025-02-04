import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_grow/features/profile/controller/profile_data_cotroller.dart';
import 'package:skill_grow/features/profile/model/password_update_request_model.dart';
import 'package:skill_grow/features/profile/service/update_password_service.dart';

import '../../../core/widgets/snackbar.dart';

class UpdatePasswordController extends GetxController {
  ProfileDataCotroller profileDataCotroller = Get.put(ProfileDataCotroller());
  // Form key
  final formKey = GlobalKey<FormState>();

  // Text controllers
      TextEditingController currentPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

  // State management
  var isLoading = false.obs;

  // Email validation

  // Login function
  Future<void> updatePassword() async {
    isLoading.value = true;
    try {
      final requestModel = PasswordUpdateRequestModel(
        currentPassword: currentPasswordController.text.trim(),
        newPassword: newPasswordController.text.trim(),
        passwordConfirmation: confirmPasswordController.text.trim(),
      );

      final response = await UpdatePasswordService().updatePassword(requestModel);

      if (response.status == 'success') {
        // Handle success, navigate to home
        customSnackbar(
            title: "Success",
            message: response.message.toString(),
            type: CustomSnackbarType.success);
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
