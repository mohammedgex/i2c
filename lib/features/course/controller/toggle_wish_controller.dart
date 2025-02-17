import 'package:get/get.dart';
import 'package:skill_grow/features/course/controller/wish_list_controller.dart';
import '../../../core/Global/api_endpoint.dart';
import '../../../core/Global/api_service.dart';

class ToggleWishController extends GetxController {
  Future<void> sendStatus({required String slug}) async {
    String url = ApiEndpoint.dashboardAddRemoveWishlistUrl(course_slug: slug);
    WishListController wishListController = Get.put(WishListController());

    print("📡 Updating lesson status for Lesson ID: $slug");

    var response = await ApiService().getData(
      url: url,
      requiresAuth: true,
    );

    if (response != null) {
      print("✅ API Response Received!");

      if (wishListController.wishList.isNotEmpty) {
        var watchedLectures = wishListController.wishList.value;
        String course_slug = slug;

        // Toggle lesson status without refreshing entire course
        if (watchedLectures.contains(course_slug)) {
          watchedLectures.remove(course_slug);
          print("❌ Lesson ID $course_slug marked as incomplete.");
        } else {
          wishListController.fetchCourses();
          print("✅ Lesson ID $course_slug marked as complete.");
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
