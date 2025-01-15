import 'package:dio/dio.dart';
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/Global/response_model.dart';
import 'package:skill_grow/features/authentication/model/registration_model.dart';

import '../../../core/Global/api_service.dart';

class RegistrationService {
  final ApiService _apiService = ApiService();

  // Function to handle login
  Future<GlobalResponseModel> register(RegistrationRequestModel requestModel) async {
    try {
      const String url = ApiEndpoint.registerUrl;

      Response? response = await _apiService.postData(
        url: url,
        data: requestModel.toJson(),
        requiresAuth: false,
      );

      print(response!.data);

      // Convert response to LoginResponseModel
      return GlobalResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      print('Login failed: ${e.response?.data ?? e.message}');
      rethrow;
    }
  }
}
