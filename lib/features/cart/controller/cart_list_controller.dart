import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/api_endpoint.dart';

import '../../../core/Global/api_service.dart';
import '../model/cart_list_model.dart';

class CartListController extends GetxController {
  final ApiService _apiService = ApiService();

  var cartData = CartData(totalQty: 0, totalAmount: '', cartCourses: []).obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCartData();
  }

  // Fetch cart data
  Future<void> fetchCartData() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      dio.Response? response = await _apiService.getData(
          url: ApiEndpoint.dashboardCartListUrl(currency: "USD"),
          requiresAuth: true);

      if (response != null && response.statusCode == 200) {
        var jsonData = response.data;
        cartData.value = CartData.fromJson(jsonData['data']);
      } else {
        errorMessage.value = 'Failed to load cart data';
      }
    } catch (e) {
      errorMessage.value = 'Error: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }
}
