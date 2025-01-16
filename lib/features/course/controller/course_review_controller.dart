import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/Global/api_service.dart';
import 'package:skill_grow/features/course/model/course_review_model.dart';

class CourseReviewController extends GetxController {
  // Observable state
  final slug;
  CourseReviewController(this.slug);

  var course = Rxn<CourseReviewsResponse>();
  var isLoading = false.obs;

  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchCourseReview(1);
  }

  // Fetch course data from API
  Future<void> fetchCourseReview(page) async {
    isLoading.value = true;

    try {
      dio.Response? response = await _apiService.getData(
        url: ApiEndpoint.courseReviewUrl(
            course_slug: slug, page: page),
      );
      print(response!.data);

      if (response.data != null) {
        // Parse the response data into the Course model
        course.value = CourseReviewsResponse.fromJson(response.data);
      }
    } catch (e) {
      // Handle errors
      print('Error fetching course data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
