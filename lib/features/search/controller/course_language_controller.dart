import 'package:get/get.dart' as getx; // Alias GetX
import 'package:dio/dio.dart' as dio; // Alias Dio
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/Global/api_service.dart';
import 'package:skill_grow/core/Global/error_handler.dart';
import '../model/course_language_model.dart';

class CourseLanguageController extends getx.GetxController {
  final ApiService _apiService = ApiService();
  var languages = <CourseLanguageModel>[].obs; // Observable list to store courses
  var isLoading = false.obs; // Observable to manage loading state
  var errorMessage = ''.obs; // Observable for error messages

  @override
  void onInit() {
    super.onInit();
    fetchCourseLanguages();
  }

  // Fetch courses data from API
  Future<void> fetchCourseLanguages() async {
    isLoading.value = true;
    errorMessage.value = ''; // Clear any previous error messages

    try {
      // Example URL - Replace with actual API endpoint
      String url = ApiEndpoint.courseLanguagesUrl;

      // Fetch data using GET method
      dio.Response? response = await _apiService.getData(url: url);

      if (response != null && response.statusCode == 200) {
        // Parse the response data into CourseModel
        CourseLanguageResponseModel courseModel =
            CourseLanguageResponseModel.fromJson(response.data);
        languages.value =
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
