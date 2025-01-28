import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/Global/api_service.dart';
import '../model/learning_course_details_model.dart';

class LearningDataController extends GetxController {
  final String slug;
  LearningDataController(this.slug);

  // Observable state
  var course = Rxn<LearningCourseDetailsModel>();
  var isLoading = false.obs;
  var alreadyWatchedLectures = <String>[].obs;

  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchCourseData();
  }

  // Fetch course data from API
  Future<void> fetchCourseData() async {
    isLoading.value = true;

    try {
      final dio.Response? response = await _apiService.getData(
        url: ApiEndpoint.dashboardLearningUrl(course_slug: slug),
      );

      if (response?.data != null) {
        final fetchedCourse = LearningCourseDetailsModel.fromJson(response!.data);
        
        // Update the state only when data is available
        course.value = fetchedCourse;

        // Ensure alreadyWatchedLectures is properly initialized
        alreadyWatchedLectures.assignAll(fetchedCourse.data.alreadyWatchedLectures);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load course data. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }
}
