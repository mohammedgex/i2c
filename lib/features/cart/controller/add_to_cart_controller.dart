import 'package:get/get.dart';
import 'package:skill_grow/core/Global/api_service.dart';
import 'package:skill_grow/core/widgets/snackbar.dart';
import 'package:skill_grow/features/cart/controller/cart_list_controller.dart';
import 'package:skill_grow/features/cart/model/add_to_cart_model.dart';
import 'package:dio/dio.dart' as dio;
import '../../../core/Global/api_endpoint.dart';

class AddToCartController extends GetxController {
  final ApiService _apiService = ApiService();
  var cartCount = 0.obs;
  var isLoading = false.obs;

  CartListController cartListController = Get.put(CartListController());

  Future<void> addToCart(String slug) async {
    isLoading.value = true;

    try {
      dio.Response? response = await _apiService.postData(
        url: ApiEndpoint.dashboardAddToCartUrl(slug: slug),
        requiresAuth: true,
      );

      if ((response != null && response.statusCode == 200) || response != null && response.statusCode == 201) {
        final cartResponse = AddToCartResponseModel.fromJson(response.data);
        cartCount.value = cartResponse.cartCount;

        customSnackbar(
            title: "Success",
            message: cartResponse.message,
            type: CustomSnackbarType.success,
          );

        cartListController.fetchCartData();
      } else {
        // print("Error: ${response?.data}");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
