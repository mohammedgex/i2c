import 'package:get/get.dart';

class BottomNavController extends GetxController {
  // Manage the selected index for the bottom navigation bar
  var currentIndex = 0.obs;

  // Update the index when a tab is selected
  void updateIndex(int index) {
    currentIndex.value = index;
  }
}
