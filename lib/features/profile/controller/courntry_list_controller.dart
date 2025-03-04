import 'package:get/get.dart';
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/api_service.dart';
import 'package:skill_grow/core/Global/error_handler.dart';
import 'package:skill_grow/features/profile/model/country_list_model.dart';

class CourntryListController extends GetxController {
  final ApiService _apiService = ApiService();

  var isLoading = false.obs;
  var countryList = Rx<CountryListResponseModel?>(null);

  @override
  void onInit() async {
   
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;
      dio.Response? response = await _apiService.getData(
        url: ApiEndpoint.countriesUrl,
        requiresAuth: false,
      );

      if (response != null && response.statusCode == 200) {
        countryList.value = CountryListResponseModel.fromJson(response.data);
      } else {
        GlobalErrorHandler.handleError("Failed to fetch data");
      }
    } catch (e) {
      GlobalErrorHandler.handleError(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
