import 'package:get/get.dart';

import '../../../core/Global/sharedPref.dart';

class LanguageSelectionController extends GetxController {
  // Track the index of the selected language
  var selectedIndex = Rxn<int>();

  // Method to select a language
  void selectItem({required int index, required String language, required String code, required String direction, required bool is_default}) {
            SharedPrefUtil.put('language', language);
            SharedPrefUtil.put('language_code', code);
            SharedPrefUtil.put('text_direction', direction);
            SharedPrefUtil.put('is_default', is_default);
    selectedIndex.value = index; // Update the selected index
    print("Selected Index: $index");
  }
}
