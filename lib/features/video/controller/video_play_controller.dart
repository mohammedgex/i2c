import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/api_endpoint.dart';
import '../../../core/Global/api_service.dart';
import '../model/video_file_model.dart';

class VideoPlayController extends GetxController {
  RxMap initialVideoDetails = {}.obs;

  final ApiService _apiService = ApiService();

  var isLoading = false.obs;
  var videoFile = Rxn<VideoFileResponseModel>();

  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchVideoFile( slug: initialVideoDetails['slug'].toString(),
  //           type: initialVideoDetails['type'].toString(),
  //           id: initialVideoDetails['id'].toString());
  // }

  Future<void> fetchVideoFile({required String id, required String slug, required String type }) async {
    isLoading.value = true;

    try {
      dio.Response? response = await _apiService.getData(
        url: ApiEndpoint.dashboardLearningGetFileInfoUrl(
            course_slug: slug,
            type: type,
            lesson_id: id,
      ));

      if (response != null && response.data != null) {
        videoFile.value = VideoFileResponseModel.fromJson(response.data);
      }
    } catch (e) {
      print("Error fetching video file: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
