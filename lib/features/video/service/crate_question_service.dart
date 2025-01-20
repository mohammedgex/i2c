import 'package:dio/dio.dart';
import 'package:skill_grow/core/Global/response_model.dart';
import 'package:skill_grow/features/video/model/create_question_model.dart';
import '../../../core/Global/api_service.dart';

class CrateQuestionService {
  final ApiService _apiService = ApiService();

  // Function to handle login
  Future<GlobalResponseModel> createQuestion(
      QuestionRequest requestModel, String url) async {
    try {
      Response? response = await _apiService.postData(
        url: url,
        data: requestModel.toJson(),
        requiresAuth: true,
      );

      // Convert response to LoginResponseModel
      return GlobalResponseModel.fromJson(response!.data);
    } on DioException catch (e) {
      print('Login failed: ${e.response?.data ?? e.message}');
      rethrow;
    }
  }
}
