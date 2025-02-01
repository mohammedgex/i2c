import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/error_handler.dart';
import 'package:skill_grow/features/profile/model/profile_model.dart';
import '../../../core/Global/api_endpoint.dart';
import '../../../core/Global/api_service.dart';

class ProfileDataCotroller extends GetxController {
  final ApiService _apiService = ApiService();

  var isLoading = false.obs;
  var userDataResponse = Rx<UserDataResponseModel?>(null);

  @override
  void onInit() async {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      isLoading(true);
      dio.Response? response = await _apiService.getData(
        url: ApiEndpoint.dashboardProfileUrl,
      );

      if (response != null && response.statusCode == 200) {
        userDataResponse.value = UserDataResponseModel.fromJson(response.data);
      } else {
        GlobalErrorHandler.handleError("Failed to fetch data");
      }
    } catch (e) {
      GlobalErrorHandler.handleError(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> postData(String url, Map<String, dynamic> requestData) async {
    try {
      isLoading(true);
      dio.Response? response = await _apiService.postData(
        url: url,
        data: requestData,
      );

      if (response != null && response.statusCode == 200) {
        userDataResponse.value = UserDataResponseModel.fromJson(response.data);
      } else {
        GlobalErrorHandler.handleError("Failed to send data");
      }
    } catch (e) {
      GlobalErrorHandler.handleError(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
