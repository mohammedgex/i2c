import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/features/quiz/model/answer_submit_model.dart';
import '../../../core/Global/api_service.dart';
import '../controller/state_controller.dart';

class QuizSubmissionController extends GetxController {
  final ApiService _apiService = ApiService();
  final CheckBoxController checkBoxController = Get.find<CheckBoxController>();

  var isLoading = false.obs;
  var submissionSuccess = false.obs;

  Future<void> submitAnswers(int quizId) async {
    if (checkBoxController.selectedAnswers.isEmpty) {
      Get.snackbar("Error", "Please select at least one answer.");
      return;
    }

    isLoading.value = true;

    // Convert selected answers to API format
    List<AnswerRequest> answerList = checkBoxController.selectedAnswers.entries
        .map((entry) =>
            AnswerRequest(questionId: entry.key, answerId: entry.value))
        .toList();

    AnswerSbumitRequestModel requestModel =
        AnswerSbumitRequestModel(answers: answerList);

    try {
      dio.Response? response = await _apiService.postData(
        url: ApiEndpoint.dashboardLearningQuizeUrl(
            course_slug: "building-scalable-microservices",
            id: "36"), // Replace with actual API endpoint
        data: requestModel.toJson(),
        requiresAuth: true,
      );

      print(response!.data);
      if (response.statusCode == 200) {
        submissionSuccess.value = true;
        // Get.snackbar("Success", "Quiz submitted successfully!");
      } else {
        // Get.snackbar("Error", "Failed to submit quiz. Please try again.");
      }
    } catch (e) {
      // Get.snackbar("Error", "An unexpected error occurred.");
    } finally {
      isLoading.value = false;
    }
  }
}
