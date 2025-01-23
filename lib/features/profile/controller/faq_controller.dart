import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/error_handler.dart';
import '../../../core/Global/api_endpoint.dart';
import '../../../core/Global/api_service.dart';
import '../model/faq_model.dart';


class FAQController extends GetxController {
  final ApiService _apiService = ApiService();

  var isLoading = false.obs;
  var faqResponse = Rx<FaqResponseModel?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      isLoading(true);
      dio.Response? response = await _apiService.getData(
        url: ApiEndpoint.faqUrl(languageCode: "en"),

      );

      if (response != null && response.statusCode == 200) {
        faqResponse.value = FaqResponseModel.fromJson(response.data);
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
        faqResponse.value = FaqResponseModel.fromJson(response.data);
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
