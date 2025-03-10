import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/Global/api_service.dart';
import '../model/enrolled_course_model.dart';

class EnrolledCourseController extends GetxController {
  var courses = <Course>[].obs; // Store courses
  var isLoading = false.obs; // Tracks loading state
  var currentPage = 1.obs; // Current page for pagination
  var isMoreDataAvailable = true.obs; // Controls pagination
  var errorMessage = ''.obs; // Stores error messages

  final ApiService _apiService = ApiService();

  // Fetch course data from API
  Future<void> fetchData(int page) async {
    // Prevent duplicate requests or unnecessary calls
    if (!isMoreDataAvailable.value || isLoading.value) return;

    isLoading.value = true;
    errorMessage.value = ''; // Clear any previous errors

    try {
      dio.Response? response = await _apiService.getData(
        requiresAuth: true,
        showSnackbar: false,
        url: ApiEndpoint.dashboardEnrolledCourseUrl(page: page, limit: 10),
      );

      if (response != null && response.data != null) {
        var fetchedData = EnrolledCourseResponseModel.fromJson(response.data);

        if (fetchedData.data.isNotEmpty) {
          // Append new courses to the list
          courses.addAll(fetchedData.data);

          // Update pagination state
          currentPage.value = page + 1; // Increment page for next request
          isMoreDataAvailable.value =
              currentPage.value <= fetchedData.pagination.lastPage;
        } else {
          // No more data available
          isMoreDataAvailable.value = false;
        }
      } else {
        // Handle null response
        errorMessage.value = 'No data found';
      }
    } catch (e) {
      // Handle errors
      errorMessage.value = 'Error fetching course data: $e';
      print('Error fetching course data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Refresh data (reset and fetch first page)
  Future<void> refreshData() async {
    // Reset state
    courses.clear();
    currentPage.value = 1;
    isMoreDataAvailable.value = true;

    // Fetch first page
    await fetchData(1);
  }
}
