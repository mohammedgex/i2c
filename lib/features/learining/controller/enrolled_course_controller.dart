import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/Global/api_service.dart';
import 'package:skill_grow/features/learining/model/enrolled_course_model.dart';

class EnrolledCourseController extends GetxController {
  // Observable state

  var course = Rxn<EnrolledCourseResponseModel>();
  var isLoading = false.obs;

  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchData(1);
  }

  // Fetch course data from API
Future<void> fetchData(page) async {
  isLoading.value = true;

  try {
    dio.Response? response = await _apiService.getData(
      requiresAuth: true,
      url: ApiEndpoint.dashboardEnrolledCourseUrl(page: page),
    );

    if (response != null && response.data != null) { // ✅ Check for null first
      print(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        course.value = EnrolledCourseResponseModel.fromJson(response.data);
      } else {
        print("Error: Invalid status code ${response.statusCode}");
      }
    } else {
      print("Error: API response is null or empty");
    }
  } catch (e) {
    print('Error fetching course data: $e');
  } finally {
    isLoading.value = false;
  }
}


}
