import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_grow/features/profile/controller/profile_data_cotroller.dart';
import 'package:skill_grow/features/profile/model/update_profile_request_model.dart';
import 'package:skill_grow/features/profile/service/update_profile_service.dart';

import '../../../core/widgets/snackbar.dart';

class UpdateProfileController extends GetxController {
  ProfileDataCotroller profileDataCotroller = Get.put(ProfileDataCotroller());

  // Form key
  final formKey = GlobalKey<FormState>();

  // Text controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  // State management
  var isLoading = false.obs;

  @override
  void onInit() {
    nameController.text =
        profileDataCotroller.userDataResponse.value!.data.name;
    emailController.text =
        profileDataCotroller.userDataResponse.value!.data.email;
    phoneController.text =
        profileDataCotroller.userDataResponse.value!.data.phone;
    ageController.text =
        profileDataCotroller.userDataResponse.value!.data.age.toString();

    super.onInit();
  }
  // Email validation

  // Login function
  Future<void> updateProflie() async {
    isLoading.value = true;
    try {
      final requestModel = UpdateProfileRequestModel(
        email: emailController.text.trim(),
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        age: int.parse(ageController.text.trim()),
      );

      final response = await UpdateProfileService().updateProfile(requestModel);

      if (response.status == 'success') {
        // Handle success, navigate to home
        customSnackbar(
            title: "Success",
            message: response.message.toString(),
            type: CustomSnackbarType.success);

        profileDataCotroller.fetchData();
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
