import 'package:get/get.dart';
import '../../../core/images/app_image.dart';

class FreshCourseItemController extends GetxController {
  // Initial loading state
  RxBool isLoading = true.obs;

  // List of fresh courses
  RxList freshCourses = [
    {
      "image": AppImage.freshCourseImage1,
      "title": "Master Laravel 11 & PHP: From Beginner to Advanced",
      "author": "Web Solution Us",
      "totalStudents": "1000+",
      "rating": "4.5",
      "previousPrice": r"$100",
      "currentPrice": r"$50"
    },
    {
      "image": AppImage.freshCourseImage2,
      "title": "Master Laravel 11 & PHP: From Beginner to Advanced",
      "author": "Web Solution Us",
      "totalStudents": "1000+",
      "rating": "4.5",
      "previousPrice": r"$ 100",
      "currentPrice": r"$ 50"
    },
    {
      "image": AppImage.freshCourseImage1,
      "title": "Master Laravel 11 & PHP: From Beginner to Advanced",
      "author": "Web Solution Us",
      "totalStudents": "1000+",
      "rating": "4.5",
      "previousPrice": r"$100",
      "currentPrice": r"$50"
    },
    {
      "image": AppImage.freshCourseImage2,
      "title": "Master Laravel 11 & PHP: From Beginner to Advanced",
      "author": "Web Solution Us",
      "totalStudents": "1000+",
      "rating": "4.5",
      "previousPrice": r"$ 100",
      "currentPrice": r"$ 50"
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();

    // Simulate loading for 5 seconds
    Future.delayed(Duration(seconds: 3), () {
      isLoading.value = false; // Set isLoading to false after 5 seconds
    });
  }
}
