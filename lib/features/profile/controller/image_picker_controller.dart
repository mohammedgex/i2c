import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart' as dio; // Alias Dio package
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/constant/constant.dart';

import '../../../core/Global/api_service.dart';
import '../../../core/Global/error_handler.dart';

class ImagePickerController extends GetxController {
  final ImagePicker _picker = ImagePicker(); // Use dependency injection
  final Rx<File?> profileImage = Rx<File?>(null);
  final RxBool isUploading = false.obs; // Observe upload state

  Future<void> pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (pickedFile != null) {
        profileImage.value = File(pickedFile.path);
        _showConfirmationBottomSheet();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  final RxString errorMessage = ''.obs; // Observable for error message

  void _showConfirmationBottomSheet() {
    Get.bottomSheet(
      isDismissible: false,
      Obx(
        () => Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Confirm Image",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              verticalGap(10.sp),
              profileImage.value != null
                  ? Image.file(profileImage.value!,
                      width: 150, height: 150, fit: BoxFit.cover)
                  : const CircularProgressIndicator(),
              verticalGap(10.sp),
              if (errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    errorMessage.value,
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ),
              verticalGap(10.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      errorMessage.value = ''; // Reset error on close
                      Get.back(); // Close bottom sheet
                    },
                    icon: Icon(Icons.cancel, color: Colors.red),
                    label: Text("Cancel"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300]),
                  ),
                  ElevatedButton.icon(
                    onPressed: isUploading.value
                        ? null
                        : () async {
                            await uploadImage();
                          },
                    icon: isUploading.value
                        ? CircularProgressIndicator(color: Colors.white)
                        : Icon(Icons.upload, color: Colors.white),
                    label: Text(isUploading.value ? "Uploading..." : "Upload"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                ],
              ),
              verticalGap(10.sp),

              // Show error message if exists
            ],
          ),
        ),
      ),
    );
  }

  Future<void> uploadImage() async {
  if (profileImage.value == null) {
    GlobalErrorHandler.handleError('No image selected!');
    return;
  }

  try {
    isUploading.value = true;
    errorMessage.value = ''; // Reset previous error message

    dio.Response? response = await ApiService().uploadImage(
      showSnackbar: true,
      url: ApiEndpoint.dashboardProfilePictureUpdateUrl, // Actual API URL
      imageFile: profileImage.value!,
    );

    if (response != null) {
      // Check if the response status is success
      if (response.statusCode == 200) {
        String? imageUrl = response.data["image_url"]; // Adjust API response
        // Display success message from API
        String successMessage = response.data["message"] ?? 'Image uploaded successfully!';
        Get.snackbar('Success', successMessage, snackPosition: SnackPosition.TOP);
        print("Uploaded Image URL: $imageUrl");
      } 
      // Handle validation failure like image size
      else if (response.statusCode == 422) {
        String error = response.data["message"]?["image"]?.join(', ') ?? "Image validation failed.";
        errorMessage.value = error;
        Get.snackbar('Upload Failed', errorMessage.value, snackPosition: SnackPosition.TOP);
      } 
      // Handle other response errors
      else {
        String error = response.data["message"] ?? "An error occurred during the upload.";
        errorMessage.value = error;
        GlobalErrorHandler.handleError(error); // Show error using GlobalErrorHandler
      }
    } else {
      // If response is null
      GlobalErrorHandler.handleError('Failed to get a valid response from the server.');
    }
  } catch (e) {
    // Catching unexpected errors
    GlobalErrorHandler.handleError(e);
  } finally {
    isUploading.value = false;
    
  }
}

}
