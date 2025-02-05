import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/Global/api_service.dart';
import 'package:skill_grow/features/course/model/course_details_model.dart';

import '../../../core/Global/sharedPref.dart';

class CourseDetalisController extends GetxController {
  final String slug;
  CourseDetalisController(this.slug);

  // Observable state
  var course = Rxn<CourseDetailsResponseModel>();
  var isLoading = false.obs;

  final ApiService _apiService = ApiService();

  var currency_code = "USD";

  @override
  void onInit() async {
    currency_code = await SharedPrefUtil.get('currency_code', 'USD');
    super.onInit();
    fetchCourseData(slug);
  }

  // Fetch course data from API
  Future<void> fetchCourseData(String slug) async {
    isLoading.value = true;

    try {
      dio.Response? response = await _apiService.getData(
        url: ApiEndpoint.coursesUrl(slug: slug, currency: currency_code),
      );

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
