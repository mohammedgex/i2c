import 'dart:async';
import 'package:get/get.dart';
import 'package:skill_grow/features/quiz/controller/submit_answer_controller.dart';

  QuizSubmissionController quizSubmissionController =
        Get.put(QuizSubmissionController());
class CountdownController extends GetxController {
  var hours = 0.obs;
  var minutes = 0.obs;
  var seconds = 0.obs;
  Timer? _timer;

  var questionId = "".obs;
  var slug = ''.obs;
 

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
        print("Time's up!");
         quizSubmissionController.submitAnswers(
                        quizId: questionId.value,
                        slug: slug.value,
                      );
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
  var selectedAnswers = <int, int>{}.obs; // {questionId: selectedAnswerId}
  var isLoading = false.obs;
  var submittedQuestions = <int>{}.obs; // To track submitted questions

  // To store structured answers for submission
  List<Map<String, dynamic>> answerList = [];

  void selectAnswer(int questionId, int answerId, int quizId) async {
    // Update the answer for the selected question
    selectedAnswers[questionId] = answerId;

    // Check if the question has already been submitted
    if (!submittedQuestions.contains(questionId)) {
      // Submit the answer if it has not been submitted yet
      await submitAnswer(questionId, answerId, quizId);
    } else {
      // If the question has already been submitted, update the existing answer
      await updateAnswer(questionId, answerId);

      // Notify the user about the resubmission
   
    }
  }

  Future<void> submitAnswer(int questionId, int answerId, int quizId) async {
    isLoading.value = true;

    // Check if the answer for the question is already present
    bool answerExists =
        answerList.any((answer) => answer["question_id"] == questionId);

    if (!answerExists) {
      // If not, add a new entry
      answerList.add({
        "question_id": questionId,
        "answer_id": answerId,
      });
    } else {
      // If it exists, update the existing entry
      updateAnswer(questionId, answerId);
    }

    Map<String, dynamic> requestModel = {
      "answers": answerList,
    };

    print(requestModel); // For debugging: print the request model

    // Add the questionId to submitted questions
    submittedQuestions.add(questionId);

    // Simulate a delay or API call here if needed
    await Future.delayed(Duration(seconds: 1));

    isLoading.value = false;
  }

  Future<void> updateAnswer(int questionId, int answerId) async {
    // Update the existing answer in the answerList
    for (var answer in answerList) {
      if (answer["question_id"] == questionId) {
        answer["answer_id"] = answerId; // Update the answer ID
        print("Updated Answer: $answer"); // Print updated answer for debugging
        break;
      }
    }

    // Print the updated request model
    print({"answers": answerList});
  }

  void printSelectedAnswers() {
    print("Selected Answers:");
    selectedAnswers.forEach((questionId, answerId) {
      print("Question ID: $questionId, Selected Answer ID: $answerId");
    });
  }
}
