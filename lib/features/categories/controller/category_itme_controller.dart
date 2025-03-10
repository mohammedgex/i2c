import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/api_endpoint.dart';
import '../../../core/Global/api_service.dart';
import '../../../core/Global/sharedPref.dart';
import '../model/category_list_model.dart';

class MainCategoryController extends GetxController {
  final ApiService _apiService = ApiService();

  // Observables
  var categories = <CategoryListResponseModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    var langCode = await SharedPrefUtil.get('language_code', 'en');
    super.onInit();
    fetchCategories(langCode);
  }

  // Fetch Categories from API
  Future<void> fetchCategories(String languageCode) async {
    isLoading.value = true;

    try {
      final dio.Response? response = await _apiService.getData(
        url: ApiEndpoint.courseMainCategoriesUrl(languageCode: languageCode),
        requiresAuth: false,
      );

      if (response != null && response.statusCode == 200) {
        final categoryModel = CategoryModel.fromJson(response.data);
        categories.value = categoryModel.categories;
      } else {
        Get.snackbar('Error', 'Failed to load categories');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
