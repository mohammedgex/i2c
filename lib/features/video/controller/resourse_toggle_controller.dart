
import 'package:get/get.dart';

class ResourseToggleController extends GetxController {
   RxInt selectedIndex = 0.obs;

  toggole(index) {
    selectedIndex(index);
  }
}