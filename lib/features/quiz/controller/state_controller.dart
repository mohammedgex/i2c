import 'dart:async';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:skill_grow/core/widgets/snackbar.dart';

import '../../../core/Global/api_endpoint.dart';
import '../../../core/Global/api_service.dart';
import '../model/answer_submit_model.dart';

class CountdownController extends GetxController {
  var hours = 0.obs;
  var minutes = 0.obs;
  var seconds = 0.obs;
  Timer? _timer;

  // Function to initialize time from minutes input
  void setTimeFromMinutes(int totalMinutes) {
    hours.value = totalMinutes ~/ 60; // Get Hours
    minutes.value = totalMinutes % 60; // Get Remaining Minutes
    seconds.value = 0; // Start from 0 seconds
    startCountdown(); // Automatically start countdown
  }

  void startCountdown() {
    stopCountdown(); // Stops any existing timer before starting a new one
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (hours.value == 0 && minutes.value == 0 && seconds.value == 0) {
        timer.cancel();
      } else {
        if (seconds.value > 0) {
          seconds.value--;
        } else {
          if (minutes.value > 0) {
            minutes.value--;
            seconds.value = 59;
          } else if (hours.value > 0) {
            hours.value--;
            minutes.value = 59;
            seconds.value = 59;
          }
        }
      }
    });
  }

  void stopCountdown() {
    _timer?.cancel();
  }

  void resetCountdown(int totalMinutes) {
    stopCountdown();
    setTimeFromMinutes(totalMinutes); // Reset with new time
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}

class CheckBoxController extends GetxController {
  final ApiService _apiService = ApiService();
  var selectedAnswers = <int, int>{}.obs; // {questionId: selectedAnswerId}
  var isLoading = false.obs;
  var submittedQuestions = <int>{}.obs; // To track submitted questions

  void selectAnswer(int questionId, int answerId, int quizId) async {
    // Don't allow selecting the same question once it's submitted
    if (submittedQuestions.contains(questionId)) {
      customSnackbar(
          title: "Info",
          message: "You can't change your answer for this question.",
          type: CustomSnackbarType.info);
      return;
    }

    selectedAnswers[questionId] = answerId;
    await submitAnswer(questionId, answerId, quizId);
  }

  Future<void> submitAnswer(int questionId, int answerId, int quizId) async {
    isLoading.value = true;

    List<AnswerRequest> answerList = [
      AnswerRequest(questionId: questionId, answerId: answerId)
    ];
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

      submittedQuestions.add(questionId); // Mark this question as submitted
    } catch (e) {
      Get.snackbar("Error", "Failed to submit answer. Please try again.");
    } finally {
      isLoading.value = false;
    }
  }
}
