import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../../core/Global/api_endpoint.dart';
import '../../../core/Global/api_service.dart';

final ApiService _apiService = ApiService();

class DeleteReplayController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isDeleted = false.obs;



  Future<void> deleteReplay(String replayId) async {
    isLoading.value = true;

    try {
      dio.Response? response = await _apiService.getData(
        url: ApiEndpoint.deleteQuestionReplyUrl(reply_id: replayId),
      );

      if (response != null) {
        if (response.statusCode == 200) {
          isDeleted.value = true;
         
        } else {
          isDeleted.value = false;
        }
      } else {
        isDeleted.value = false;
      }
    } catch (e) {
      isDeleted.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}