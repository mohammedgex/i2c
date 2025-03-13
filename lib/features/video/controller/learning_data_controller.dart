import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/Global/api_service.dart';
import '../model/learning_course_details_model.dart';

class LearningDataController extends GetxController {
  final String slug;
  LearningDataController(this.slug);

  // Observable state
  var course = Rxn<LearningCourseDetailsModel>(); // Stores course data
  var isLoading = false.obs; // Tracks loading state
  var errorMessage = ''.obs; // Stores error messages
  var alreadyWatchedLectures = <int>[].obs; // Tracks watched lectures
  var alreadyCompletedQuiz = <int>[].obs; // Tracks completed quizzes

  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchCourseData(); // Fetch course data when the controller is initialized
  }

  // Fetch course data from API
  Future<void> fetchCourseData() async {
    isLoading.value = true;
    errorMessage.value = ''; // Clear any previous errors

    try {
      final dio.Response? response = await _apiService.getData(
        url: ApiEndpoint.dashboardLearningUrl(course_slug: slug),
      );

      if (response?.data != null) {
        // Parse the response data
        final fetchedCourse = LearningCourseDetailsModel.fromJson(response!.data);

        // Update the state
        course.value = fetchedCourse;

        // Initialize watched lectures and completed quizzes
        alreadyWatchedLectures.assignAll(fetchedCourse.data.alreadyWatchedLectures);
        alreadyCompletedQuiz.assignAll(fetchedCourse.data.alreadyCompletedQuiz);
      } else {
        // Handle null response
        errorMessage.value = 'Failed to fetch course data. Please try again.';
      }
    } catch (e) {
      // Handle errors
      errorMessage.value = 'Error: $e';
      Get.snackbar('Error', 'Failed to load course data. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

  // Refresh course data
  Future<void> refreshCourseData() async {
    await fetchCourseData(); // Re-fetch the data
  }

  // Mark a lecture as watched
  void markLectureAsWatched(String lectureId) {
    if (!alreadyWatchedLectures.contains(lectureId)) {
      alreadyWatchedLectures.add(int.parse(lectureId));
    }
  }

  // Mark a quiz as completed
  void markQuizAsCompleted(int quizId) {
    if (!alreadyCompletedQuiz.contains(quizId)) {
      alreadyCompletedQuiz.add(quizId);
    }
  }
}