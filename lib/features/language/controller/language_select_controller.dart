import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import '../../../core/Global/sharedPref.dart';

class LanguageSelectionController extends GetxController {
  var selectedIndex = Rxn<int>();

  @override
  void onInit() {
    super.onInit();
    _loadSelectedLanguage(); // Load the selected language when the controller is initialized
  }

  // Method to load the selected language from SharedPreferences
  void _loadSelectedLanguage() async {
    String? language = await SharedPrefUtil.get('language', '');
    int? index = await SharedPrefUtil.get('selected_index',
        0); // Assuming you're saving the index in SharedPreferences
    if (language != null && language.isNotEmpty) {
      selectedIndex.value = index;
    }
  }

  // Method to save the selected language and reset the app
  void selectItem({
    required int index,
    required String language,
    required String code,
    required String direction,
    required bool is_default,
  }) async {
    // Save language settings to shared preferences
    await SharedPrefUtil.put('language', language);
    await SharedPrefUtil.put('language_code', code);
    await SharedPrefUtil.put('text_direction', direction);
    await SharedPrefUtil.put('is_default', is_default);
    await SharedPrefUtil.put('selected_index',
        index); // Save the selected index to SharedPreferences
    selectedIndex.value = index;

    // Restart the app using Phoenix
    await Get.deleteAll(force: true); //deleting all controllers
    Phoenix.rebirth(Get.context!); // Restarting app
    Get.reset(); // resetting getx
  }
}
