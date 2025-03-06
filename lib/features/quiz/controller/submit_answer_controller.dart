import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/features/quiz/model/quiz_result_model.dart';
import 'package:skill_grow/features/quiz/view/result_view.dart';
import '../../../core/Global/api_service.dart';
import '../controller/state_controller.dart';

class QuizSubmissionController extends GetxController {
  final ApiService _apiService = ApiService();
  final CheckBoxController checkBoxController = Get.put(CheckBoxController());

  var isLoading = false.obs;
  var submissionSuccess = false.obs;

  Future<void> submitAnswers({
    required String slug,
    required String quizId,
  }) async {
    if (checkBoxController.selectedAnswers.isEmpty) {
      Get.snackbar("Error", "Please select at least one answer.");
      return;
    }

    isLoading.value = true;

    // Convert selected answers to API format
    var answer = checkBoxController.answerList;
    var answerMap = {
      "answers": answer,
    };
    try {
      dio.Response? response = await _apiService.postData(
        url: ApiEndpoint.dashboardLearningQuizeUrl(
          course_slug: slug,
          id: quizId,
        ),
        data: answerMap,
        requiresAuth: true,
      );

      print(response!.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Parse the response into the QuizResult model
        QuizResult quizResult = QuizResult.fromJson(response.data);
        submissionSuccess.value = true;
        Get.to(() => SubmittedAnswersView(quizResult: quizResult,));
      } else {
        print("Failed to submit quiz. Response: ${response.data}");
      }
    } catch (e) {
      print("An unexpected error occurred: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
