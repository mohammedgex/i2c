import 'package:get/get.dart';

class ToggleController extends GetxController {
  RxInt selectedIndex = 2.obs;

  toggole(index) {
    selectedIndex(index);
  }
}
