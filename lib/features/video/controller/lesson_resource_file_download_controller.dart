import 'package:get/get.dart';
import 'package:skill_grow/core/Global/api_service.dart' show ApiService;
import 'package:skill_grow/features/video/model/lesson_resource_model.dart';

import '../../../core/Global/api_endpoint.dart';


class CertificateController extends GetxController {
  final ApiService _apiService = ApiService();

  var isLoading = false.obs;
  var certificate = LessonResourceModel(
    id: 0,
    title: '',
    description: '',
    filePath: '',
    storage: '',
    fileType: '',
    duration: '',
    isDownloadable: false,
  ).obs;
  var errorMessage = ''.obs;

  Future<void> fetchResource({required String slug, required String type, required String lessonId}) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await _apiService.getData(url: ApiEndpoint.dashboardLearningGetFileInfoUrl(course_slug: slug, type: type, lesson_id: lessonId));

      if (response != null && response.statusCode == 200) {
        certificate.value = LessonResourceModel.fromJson(response.data);
      }
    } catch (e) {
      errorMessage.value = 'Failed to fetch certificate: $e';
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}