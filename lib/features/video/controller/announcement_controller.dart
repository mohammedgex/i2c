import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/Global/api_service.dart';
import 'package:skill_grow/features/video/model/announcement_model.dart';
class AnnouncementController extends GetxController {
  final String slug;
  AnnouncementController(this.slug);

  // Observable state
  var announcements = Rxn<AnnouncementResponseModel>(); // Stores course data
  var isLoading = false.obs; // Tracks loading state
  var errorMessage = ''.obs; // Stores error messages


  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchAnnouncement(); // Fetch course data when the controller is initialized
  }

  // Fetch course data from API
  Future<void> fetchAnnouncement() async {
    isLoading.value = true;
    errorMessage.value = ''; // Clear any previous errors

    try {
      final dio.Response? response = await _apiService.getData(
        url: ApiEndpoint.dashboardLearningAnnouncementUrl(slug: slug),
        showSnackbar: false,
      );

      if (response?.data != null) {
        // Parse the response data
        final fetchedAnnouncement =
            AnnouncementResponseModel.fromJson(response!.data);

        // Update the state
        announcements.value = fetchedAnnouncement;

        // Initialize watched lectures and completed quizzes
        
      } else {
        // Handle null response
        errorMessage.value = 'Failed to fetch announcement data. Please try again.';
      }
    } catch (e) {
      // Handle errors
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
