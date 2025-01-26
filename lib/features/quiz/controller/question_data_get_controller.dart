import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../../core/Global/api_endpoint.dart';
import '../../../core/Global/api_service.dart';
import '../model/quiz_question_model.dart';

class QuizQuestionDataController extends GetxController {
  final ApiService _apiService = ApiService();

  // Observable variables
  var isLoading = false.obs;
  var quizData = Rxn<QuizResponseModel>();

  @override
  void onInit() {
    super.onInit();
    fetchQuiz();
  }

  // Fetch quiz data
  Future<void> fetchQuiz() async {
    try {
      isLoading.value = true;
      dio.Response? response = await _apiService.getData(
          url: ApiEndpoint.dashboardLearningQuizeUrl(
              course_slug: "building-scalable-microservices", id: "36"));

      if (response != null && response.statusCode == 200) {
        quizData.value = QuizResponseModel.fromJson(response.data);
      } else {
        Get.snackbar("Error", "Failed to load quiz data");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
