import 'package:get/get.dart';

class TextfieldController extends GetxController {
  // Use a map to hold multiple RxBool values for each TextField's visibility
  RxMap<String, RxBool> textFieldVisibility = <String, RxBool>{}.obs;

  void toggle(String key) {
    // Toggle visibility for the specific key (TextField)
    if (textFieldVisibility.containsKey(key)) {
      textFieldVisibility[key]?.value = !(textFieldVisibility[key]?.value ?? false);
    } else {
      textFieldVisibility[key] = true.obs;
    }
  }

  bool getVisibility(String key) {
    return textFieldVisibility[key]?.value ?? false;
  }
}
