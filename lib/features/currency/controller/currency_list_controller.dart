import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/Global/api_service.dart';
import '../model/currency_list_response_model.dart';


class CurrencyListController extends GetxController {
  final ApiService _apiService = ApiService();

  // Observables for loading state, response, and error
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var languageResponse = Rxn<CurrencyListResponse>();  // Change to typed response model

  @override
  void onInit() {
    super.onInit();
    // Call the API when the controller is initialized
    fetchData();
  }

  // Method to call API and handle response
  Future<void> fetchData() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      // Example: GET request, you can customize the URL and parameters
      dio.Response? response = await _apiService.getData(
        url: ApiEndpoint.currencyListUrl, // Replace with your API endpoint
        requiresAuth: false, // Set this to false if authentication is not needed
      );

      if (response != null && response.statusCode == 200) {
        // Map the response to LanguageResponseModel
        languageResponse.value = CurrencyListResponse.fromJson(response.data);
        print('API Response: ${response.data}');
      } else {
        // Handle failure response
        errorMessage.value = 'Failed to fetch data';
      }
    } catch (e) {
      // Handle errors
      errorMessage.value = 'Error: ${e.toString()}';
      print('Error: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
}
