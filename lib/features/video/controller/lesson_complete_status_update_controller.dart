import 'package:get/get.dart';
import 'package:skill_grow/features/video/controller/learning_data_controller.dart';
import '../../../core/Global/api_endpoint.dart';
import '../../../core/Global/api_service.dart';

class LessonCompleteStatusUpdateController extends GetxController {
  Future<void> sendStatus({required String lessonId}) async {
    String url =
        ApiEndpoint.dashboardLearningLessonCompleteUrl(lesson_id: lessonId);
    LearningDataController learningDataController =
        Get.find<LearningDataController>();

    print("📡 Updating lesson status for Lesson ID: $lessonId");

    var response = await ApiService().getData(
      url: url,
      requiresAuth: true,
    );

    if (response != null) {
      print("✅ API Response Received!");

      if (learningDataController.course.value != null) {
        var watchedLectures =
            learningDataController.course.value!.data.alreadyWatchedLectures;
        String lessonIntId = lessonId;

        // Toggle lesson status without refreshing entire course
        if (watchedLectures.contains(lessonIntId)) {
          watchedLectures.remove(lessonIntId);
          print("❌ Lesson ID $lessonIntId marked as incomplete.");
        } else {
          watchedLectures.add(int.parse(lessonIntId));
          print("✅ Lesson ID $lessonIntId marked as complete.");
        }

        // 🔥 Update only the specific watched list to avoid closing accordion
        update([
          'lessonStatus'
        ]); // Update only UI elements tagged with 'lessonStatus'
      } else {
        print("⚠️ Warning: `learningDataController.course.value` is null.");
      }
    } else {
      print("❌ Error: API response is null. Check endpoint or authentication.");
    }
  }
}



class QuizCompleteStatusUpdateController extends GetxController {
  Future<void> sendStatus({required String quizId}) async {
    String url =
        ApiEndpoint.dashboardLearningLessonCompleteUrl(lesson_id: quizId);
    LearningDataController learningDataController =
        Get.find<LearningDataController>();

    print("📡 Updating quiz status for Quiz ID: $quizId");

    var response = await ApiService().getData(
      url: url,
      requiresAuth: true,
    );

    if (response != null) {
      print("✅ API Response Received!");

      if (learningDataController.course.value != null) {
        var completedQuizzes =
            learningDataController.course.value!.data.alreadyCompletedQuiz;
        String quizIntId = quizId;

        // Toggle quiz status without refreshing entire course
        if (completedQuizzes.contains(quizIntId)) {
          completedQuizzes.remove(quizIntId);
          print("❌ Quiz ID $quizIntId marked as incomplete.");
        } else {
          completedQuizzes.add(int.parse(quizIntId));
          print("✅ Quiz ID $quizIntId marked as complete.");
        }

        // 🔥 Update only the specific completed quizzes list to avoid closing accordion
        update([
          'quizStatus'
        ]); // Update only UI elements tagged with 'quizStatus'
      } else {
        print("⚠️ Warning: `learningDataController.course.value` is null.");
      }
    } else {
      print("❌ Error: API response is null. Check endpoint or authentication.");
    }
  }
}