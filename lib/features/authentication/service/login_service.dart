import 'package:dio/dio.dart';
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/features/authentication/model/login_model.dart';

import '../../../core/Global/api_service.dart';

class LoginService {
  final ApiService _apiService = ApiService();

  // Function to handle login
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    try {
      const String url = ApiEndpoint.loginUrl;

      Response? response = await _apiService.postData(
        url: url,
        data: requestModel.toJson(),
        requiresAuth: false,
      );

      print(response!.data);

      // Convert response to LoginResponseModel
      return LoginResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      print('Login failed: ${e.response?.data ?? e.message}');
      rethrow;
    }
  }
}
