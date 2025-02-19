import 'package:get/get.dart';
import 'package:skill_grow/features/course/controller/wish_list_controller.dart';
import '../../../core/Global/api_endpoint.dart';
import '../../../core/Global/api_service.dart';

class ToggleWishController extends GetxController {
  RxBool isWishActive = false.obs;
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

      if (response.statusCode == 200) {
        isWishActive.value = !isWishActive.value;
        wishListController.fetchCourses();
        print("✅ WishList Status Updated!");
      }
    } else {
      print("❌ Error: API response is null. Check endpoint or authentication.");
    }
  }
}
