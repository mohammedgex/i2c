import 'package:get/get.dart' as getx; // Alias GetX
import 'package:dio/dio.dart' as dio; // Alias Dio
import 'package:get/get.dart';
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/Global/api_service.dart';
import 'package:skill_grow/core/Global/error_handler.dart';
import '../../../core/Global/sharedPref.dart';
import '../model/search_result_model.dart';
import '../view/search_detals.dart';

class SearchDataController extends getx.GetxController {
  final ApiService _apiService = ApiService();
  var searchResults =
      <SearchResultModel>[].obs; // Observable list to store courses
  var isLoading = false.obs; // Observable to manage loading state
  var errorMessage = ''.obs; // Observable for error messages

  // Fetch courses data from API

  Future<void> fetchCourseLanguages(
      String search,
      String main_category,
      String sub_category,
      String price,
      String languages_code,
      String levels,
      String rating) async {
    var currencyCode = await SharedPrefUtil.get('currency_code', 'USD');
    isLoading.value = true;
    errorMessage.value = ''; // Clear any previous error messages

    try {
      // Example URL - Replace with actual API endpoint
      String url = ApiEndpoint.searchCoursesUrl(
        currency: currencyCode,
        search: search,
        main_category: main_category,
        sub_category: sub_category,
        price: price,
        languages_code: languages_code,
        levels: levels,
        rating: rating,
      );

      // Fetch data using GET method
      dio.Response? response =
          await _apiService.getData(url: url, requiresAuth: false);

      if (response != null &&
          response.statusCode == 200 &&
          response.data != null) {
        // Parse the response data into a list of SearchResultModel
        List<dynamic> data = response.data;
        searchResults.value =
            data.map((json) => SearchResultModel.fromJson(json)).toList();

        Get.to(() => SearchDetalsView());
      } else {
        errorMessage.value = 'Failed to fetch data: ${response?.statusCode}';
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
