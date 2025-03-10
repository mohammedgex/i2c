// import 'package:get/get.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:skill_grow/core/Global/api_endpoint.dart';
// import 'package:skill_grow/core/Global/api_service.dart';
// import '../model/payment_method_list_model.dart';

// class PaymentMethodsController extends GetxController {
//   final ApiService _apiService = ApiService();

//   var isLoading = false.obs;
//   var errorMessage = ''.obs;
//   var paymentMethods = Rxn<PaymentMethods>(); // ✅ Holds PaymentMethods object

//   @override
//   void onInit() {
//     super.onInit();
//     fetchPaymentMethods();
//   }

//   Future<void> fetchPaymentMethods() async {
//     isLoading.value = true;
//     errorMessage.value = '';

//     try {
//       dio.Response? response = await _apiService.getData(
//         url: ApiEndpoint.payemntMethodsListUrl, // ✅ Replace with actual API endpoint
//         requiresAuth: true,
//       );

//       if (response != null && response.statusCode == 200) {
//         var jsonData = response.data;
//         var paymentData = PaymentMethodResponseModel.fromJson(jsonData);
//         paymentMethods.value = paymentData.data; // ✅ Assign the PaymentMethods object
//       } else {
//         errorMessage.value = 'Failed to load payment methods';
//       }
//     } catch (e) {
//       errorMessage.value = 'Error: ${e.toString()}';
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/Global/api_service.dart';
import '../model/payment_method_list_model.dart';

class PaymentMethodsController extends GetxController {
  final ApiService _apiService = ApiService();

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var paymentMethods =
      <PaymentMethod>[].obs; // ✅ List instead of a fixed object

  @override
  void onInit() {
    super.onInit();
    fetchPaymentMethods();
  }

  Future<void> fetchPaymentMethods() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      dio.Response? response = await _apiService.getData(
        url: ApiEndpoint
            .payemntMethodsListUrl, // ✅ Replace with actual API endpoint
        requiresAuth: true,
      );

      if (response != null && response.statusCode == 200) {
        var jsonData = response.data;
        var paymentData = PaymentMethodResponseModel.fromJson(jsonData);
        paymentMethods.value =
            paymentData.paymentMethods.values.toList(); // ✅ Convert map to list
      } else {
        errorMessage.value = 'Failed to load payment methods';
      }
    } catch (e) {
      errorMessage.value = 'Error: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }
}
