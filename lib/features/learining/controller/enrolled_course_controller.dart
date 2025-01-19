import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/Global/api_service.dart';


import '../model.dart/enrolled_course_model.dart';

class EnrolledCourseController extends GetxController {
  var courses = <Course>[].obs; // Store courses
  var isLoading = false.obs; // Tracks loading state
  var currentPage = 1.obs;
  var lastPage = 1.obs; // Keeps track of the last page
  var isMoreDataAvailable = true.obs; // Controls pagination

  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchData(currentPage.value);
  }

  // Fetch course data from API
  Future<void> fetchData(int page) async {
    if (!isMoreDataAvailable.value || isLoading.value) return; // Prevents duplicate requests

    isLoading.value = true;

    try {
      dio.Response? response = await _apiService.getData(
        requiresAuth: true,
        url: ApiEndpoint.dashboardEnrolledCourseUrl(page: page),
      );

      if (response != null && response.data != null) {
        var fetchedData = EnrolledCourseResponseModel.fromJson(response.data);

        // Append new courses to the list
        if (fetchedData.data.isNotEmpty) {
          courses.addAll(fetchedData.data);
          currentPage.value++;

          // Check if there are more pages to load
          if (currentPage.value > fetchedData.pagination.lastPage) {
            isMoreDataAvailable.value = false;
          }
        }
      }
    } catch (e) {
      print('Error fetching course data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
