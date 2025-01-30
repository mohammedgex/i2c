import 'package:get/get.dart' as getx; // Alias GetX
import 'package:dio/dio.dart' as dio; // Alias Dio
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/Global/api_service.dart';
import 'package:skill_grow/core/Global/error_handler.dart';
import 'package:skill_grow/features/search/model/course_level_model.dart';

import '../../../core/Global/sharedPref.dart';

class CourseLevelController extends getx.GetxController {
  final ApiService _apiService = ApiService();
  var levels = <CourseLevelModel>[].obs; // Observable list to store courses
  var isLoading = false.obs; // Observable to manage loading state
  var errorMessage = ''.obs; // Observable for error messages

  @override
  void onInit() {
    super.onInit();
    fetchCourseLevels();
  }

  // Fetch courses data from API
  Future<void> fetchCourseLevels() async {
    var langCode = await SharedPrefUtil.get('language_code', 'en');
    isLoading.value = true;
    errorMessage.value = ''; // Clear any previous error messages

    try {
      // Example URL - Replace with actual API endpoint
      String url = ApiEndpoint.courseLevelsUrl(languageCode: langCode);

      // Fetch data using GET method
      dio.Response? response = await _apiService.getData(url: url);

      if (response != null && response.statusCode == 200) {
        // Parse the response data into CourseModel
        CourseLevelResponseModel courseModel =
            CourseLevelResponseModel.fromJson(response.data);
        levels.value =
            courseModel.data; // Update the courses list with fetched data
      } else {
        errorMessage.value = 'Failed to fetch data';
      }
    } catch (e) {
      errorMessage.value =
          'Error: ${e.toString()}'; // Handle error and show message
      GlobalErrorHandler.handleError(e); // Global error handler if required
    } finally {
      isLoading.value = false;
    }
  }
}
