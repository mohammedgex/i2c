import 'dart:io';
import 'package:dio/dio.dart' as dio; // Alias Dio package
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/widgets/snackbar.dart';
import '../../../core/Global/api_service.dart';

class ImagePickerController extends GetxController {
  final ImagePicker _picker = ImagePicker(); // Use dependency injection
  final Rx<File?> profileImage = Rx<File?>(null);
  final RxBool isUploading = false.obs; // Observe upload state
  final RxBool isImageSelected = false.obs;

  Future<void> pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (pickedFile != null) {
        profileImage.value = File(pickedFile.path);
        isImageSelected.value = true;
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  final RxString errorMessage = ''.obs; // Observable for error message

  Future<void> uploadImage() async {
    if (profileImage.value == null) {
      customSnackbar(
          title: 'Error',
          message: 'No image selected',
          type: CustomSnackbarType.failed);

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

      if (response != null && response.statusCode == 200) {
        isImageSelected.value = false;
        customSnackbar(
            title: 'Success',
            message: 'Profile picture updated successfully',
            type: CustomSnackbarType.success);

        // Check if the response status is success
      } else {
        print("Error: ${response?.data}");
      }
    } catch (e) {
      // Catching unexpected errors
    } finally {
      isUploading.value = false;
    }
  }
}
