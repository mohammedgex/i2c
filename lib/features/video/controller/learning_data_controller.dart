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

  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchCourseData(slug);
  }

  // Fetch course data from API
  Future<void> fetchCourseData(String slug) async {
    isLoading.value = true;

    try {
      dio.Response? response = await _apiService.getData(
        url: ApiEndpoint.dashboardLearningUrl(
            course_slug: slug),
      );

      if (response!.data != null) {
        // Parse the response data into the Course model
        course.value =
            LearningCourseDetailsModel.fromJson(response.data);
      }
    } catch (e) {
      // Handle errors
      print('Error fetching course data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
