import 'package:get/get.dart';

class DropdownController extends GetxController {
  var selectedValue = ''.obs;

  void updateValue(String? value) {
    selectedValue.value = value ?? '';
  }

  void resetValue() {
    selectedValue.value = '';
  }
}
