import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_grow/features/profile/controller/profile_data_cotroller.dart';
import 'package:skill_grow/features/profile/model/update_bio_request_model.dart';
import 'package:skill_grow/features/profile/service/update_bio_service.dart';

import '../../../core/widgets/snackbar.dart';

class UpdateBioController extends GetxController {
  ProfileDataCotroller profileDataCotroller = Get.put(ProfileDataCotroller());
  // Form key
  final formKey = GlobalKey<FormState>();

  // Text controllers
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController shortBioController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  // State management
  var isLoading = false.obs;

  // Email validation

  // Login function
  Future<void> updateBio() async {
    isLoading.value = true;
    try {
      final requestModel = UpdateBioRequestModel(
        jobTitle: jobTitleController.text.trim(),
        shortBio: shortBioController.text.trim(),
        bio: bioController.text.trim(),
      );

      final response = await UpdateBioService().updateBio(requestModel);

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
