import 'package:get/get.dart';

class DropdownController extends GetxController {
  var items = <String>[
    "One",
    "Two",
    "Three",
    "Four",
    "Five",
    "Six",
    "Seven",
    "Eight",
    "Nine",
    "Ten"
  ].obs;
  var selectedValue = ''.obs;

  void updateValue(String? value) {
    selectedValue.value = value ?? '';
  }

  void resetValue() {
    selectedValue.value = '';
  }

  Future<List<String>> fetchItems() async {
    return items.toList();
  }
}
