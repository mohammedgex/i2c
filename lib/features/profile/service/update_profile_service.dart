import 'package:dio/dio.dart';
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/Global/response_model.dart';
import 'package:skill_grow/features/profile/model/update_profile_request_model.dart';

import '../../../core/Global/api_service.dart';

class UpdateProfileService {
  final ApiService _apiService = ApiService();

  // Function to handle login
  Future<GlobalResponseModel> updateProfile(
      UpdateProfileRequestModel requestModel) async {
    try {
      const String url = ApiEndpoint.dashboardProfileUpdateUrl;

      Response? response = await _apiService.putData(
        url: url,
        data: requestModel.toJson(),
        requiresAuth: true,
      );

      print(response!.data);

      // Convert response to LoginResponseModel
      return GlobalResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      print('Data retrieval failed: ${e.response?.data ?? e.message}');
      rethrow;
    }
  }
}
