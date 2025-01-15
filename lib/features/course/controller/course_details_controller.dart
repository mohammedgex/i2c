import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/Global/api_service.dart';
import 'package:skill_grow/features/course/model/course_details_model.dart';

class CourseDetalisController extends GetxController {
  // Observable state
  var course = Rxn<CourseDetailsResponseModel>();
  var isLoading = false.obs;

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
      dio.Response? response = await _apiService.getData(
          url: ApiEndpoint.coursesUrl(
              slug: "building-scalable-microservices", currency: "BDT"));

      if (response!.data != null) {
        // Parse the response data into the Course model
        course.value =
            CourseDetailsResponseModel.fromJson(response.data['data']);
      }
    } catch (e) {
      // Handle errors
      print('Error fetching course data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
