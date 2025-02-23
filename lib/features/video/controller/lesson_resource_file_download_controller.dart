import 'package:get/get.dart';
import 'package:skill_grow/core/Global/api_service.dart' show ApiService;
import 'package:skill_grow/features/video/model/lesson_resource_model.dart';
import '../../../core/Global/api_endpoint.dart';

class LessonResourceFileDownloadController extends GetxController {
  // Instance of ApiService for making API calls
  final ApiService _apiService = ApiService();

  // Observable variables for state management
  var isLoading = false.obs; // Tracks loading state
  var lessonResource = LessonResourceModel(
    id: 0,
    title: '',
    description: '',
    filePath: '',
    storage: '',
    fileType: '',
    duration: '',
    isDownloadable: false,
  ).obs; // Holds the fetched lesson resource data
  var errorMessage = ''.obs; // Holds error messages

  /// Fetches lesson resource data from the API
  Future<void> fetchResource({
  required String slug,
  required String type,
  required String lessonId,
}) async {
  try {
    isLoading.value = true;
    errorMessage.value = '';

    final response = await _apiService.getData(
      url: ApiEndpoint.dashboardLearningGetFileInfoUrl(
        course_slug: slug,
        type: type,
        lesson_id: lessonId,
      ),
      requiresAuth: true,
    );

    if (response != null && response.statusCode == 200) {
      // Parse the top-level response
      final responseData = response.data;

      // Check if the 'data' field exists in the response
      if (responseData != null && responseData['data'] != null) {
        // Parse the nested 'data' field into LessonResourceModel
        lessonResource.value = LessonResourceModel.fromJson(responseData['data']);
        print('Fetched Lesson Resource: ${lessonResource.value.title}');
      } else {
        errorMessage.value = 'Failed to fetch lesson resource: Data is missing in the response';
      }
    } else {
      errorMessage.value =
          'Failed to fetch lesson resource: ${response?.statusMessage ?? 'Unknown error'}';
    }
  } catch (e) {
    errorMessage.value = 'Failed to fetch lesson resource: $e';
    print('Error: $e');
  } finally {
    isLoading.value = false;
  }
}
}
