import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_grow/features/profile/model/update_address_request_model.dart';
import 'package:skill_grow/features/profile/service/update_address_service.dart';
import '../../../core/widgets/snackbar.dart';

class UpdateAddressController extends GetxController {
  // Form key
  final formKey = GlobalKey<FormState>();

  // Text controllers
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  // State management
  var isLoading = false.obs;

  // Email validation

  // Login function
  Future<void> updateBio() async {
    isLoading.value = true;
    try {
      final requestModel = UpdateAddressRequestModel(
        countryId: int.parse("1"),
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
