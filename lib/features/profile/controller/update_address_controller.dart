import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_grow/features/profile/controller/profile_data_cotroller.dart';
import 'package:skill_grow/features/profile/model/update_address_request_model.dart';
import 'package:skill_grow/features/profile/service/update_address_service.dart';
import 'package:skill_grow/widgets/controller/dropdwon_input_cntroller.dart';
import '../../../core/widgets/snackbar.dart';

class UpdateAddressController extends GetxController {
  ProfileDataCotroller profileDataCotroller = Get.put(ProfileDataCotroller());

  int? countryId;

  // Form key
  final formKey = GlobalKey<FormState>();

  // Text controllers
  DropdownController countryController = DropdownController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  // State management
  var isLoading = false.obs;

  @override
  void onInit() {
    // Get the user data from the profile controller
    final userData = profileDataCotroller.userDataResponse.value!.data;

    // Set initial values for controllers
    countryId = userData.countryId; // Country ID
    stateController.text = userData.state;
    cityController.text = userData.city;
    addressController.text = userData.address;

    super.onInit();
  }

  // Login function
  Future<void> updateAddress() async {
    isLoading.value = true;
    try {
      final requestModel = UpdateAddressRequestModel(
        countryId: countryId!,
        state: stateController.text.trim(),
        city: cityController.text.trim(),
        address: addressController.text.trim(),
      );

      final response = await UpdateAddressService().updateAddress(requestModel);

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
