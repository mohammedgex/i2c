import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_grow/features/profile/controller/profile_data_cotroller.dart';
import 'package:skill_grow/features/profile/model/update_social_links_request_model.dart';
import 'package:skill_grow/features/profile/service/update_social_links_service.dart';

import '../../../core/widgets/snackbar.dart';

class UpdateSocialLinksController extends GetxController {
  ProfileDataCotroller profileDataCotroller = Get.put(ProfileDataCotroller());
  // Form key
  final formKey = GlobalKey<FormState>();

  TextEditingController facebookController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController githubController = TextEditingController();

  // State management
  var isLoading = false.obs;

  @override
  void onInit() {
    facebookController = TextEditingController(
        text: profileDataCotroller.userDataResponse.value!.data.facebook);
    twitterController = TextEditingController(
        text: profileDataCotroller.userDataResponse.value!.data.twitter);
    linkedinController = TextEditingController(
        text: profileDataCotroller.userDataResponse.value!.data.linkedin);
    websiteController = TextEditingController(
        text: profileDataCotroller.userDataResponse.value!.data.website);
    githubController = TextEditingController(
        text: profileDataCotroller.userDataResponse.value!.data.github);
    super.onInit();
  }

  // Login function
  Future<void> updatesocialLinks() async {
    isLoading.value = true;
    try {
      final requestModel = UpdateSocialLinksRequestModel(
        facebook: facebookController.text.trim(),
        linkedin: linkedinController.text.trim(),
        github: githubController.text.trim(),
        website: websiteController.text.trim(),
        twitter: twitterController.text.trim(),
      );

      final response =
          await UpdateSocialLinksService().updateSocialLinks(requestModel);

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
