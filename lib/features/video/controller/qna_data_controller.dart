import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/Global/api_service.dart';
import 'package:skill_grow/features/video/model/qna_data_model.dart';

import '../../../core/widgets/snackbar.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';
import '../model/create_question_model.dart';
import '../service/crate_question_service.dart';

class QnaDataController extends GetxController {
  // Observable state

  var qnaData = Rxn<QnaDataResponseModel>();
  var isLoading = false.obs;
  var isFached = false.obs;

  final ApiService _apiService = ApiService();

  // Fetch course data from API
  Future<void> fetchQnaData({
    required String lessonId,
    required String slug,
  }) async {
    print("📡 Fetching QNA data for Lesson ID: $lessonId");
    print("📡 Fetching QNA data for Course Slug: $slug");
    isLoading.value = true;

    try {
      final String url =
          ApiEndpoint.qnaUrl(lesson_id: lessonId, course_slug: slug);
      print("API URL: $url");

      dio.Response? response =
          await _apiService.getData(url: url, showSnackbar: false);

      if (response != null && response.data != null) {
        // Parse the response data into the Course model
        qnaData.value = QnaDataResponseModel.fromJson(response.data);
      } else {
        qnaData.value = null;
        isFached.value = true;
        print("Error: Received null response from API");
      }
    } on dio.DioError catch (dioError) {
      print("DioError: ${dioError.response?.statusCode} - ${dioError.message}");
    } catch (e) {
      // Handle other errors
      print('Error fetching course data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

class CreateQuestionController extends GetxController {
  String lessonId = "";
  String slug = "";
  // Form key
  final formKey = GlobalKey<FormState>();
  QnaDataController qnaDataController = Get.put(QnaDataController());
  // Text controllers
  final TextEditingController questionController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // State management
  var isLoading = false.obs;

  // Email validation

  String? validateQuestion(String? value) {
    if (value == null || value.isEmpty) {
      return translatedText('Question is required');
    }

    return null;
  }

  String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return translatedText('Description is required');
    }

    return null;
  }

  @override
  void dispose() {
    questionController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  // Login function
  Future<void> createQuestion() async {
    isLoading.value = true;
    try {
      final requestModel = QuestionRequest(
        question: questionController.text.trim(),
        description: descriptionController.text.trim(),
      );

      String url =
          ApiEndpoint.addQuestionUrl(course_slug: slug, lesson_id: lessonId);

      final response =
          await CrateQuestionService().createQuestion(requestModel, url);

      if (response.status == 'success') {
        // Handle success, navigate to home
        customSnackbar(
            title: "Success",
            message: response.message.toString(),
            type: CustomSnackbarType.success);
      }
      questionController.clear();
      descriptionController.clear();
      Get.back();
      qnaDataController.fetchQnaData(lessonId: lessonId, slug: slug);
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

class DeleteQuestionAndReplyController extends GetxController {
  QnaDataController qnaDataController = Get.put(QnaDataController());
  ApiService apiService = ApiService();
  var isLoading = false.obs;

  Future<void> deleteReplay(
      {required String replyId,
      required String lessonId,
      required String slug}) async {
    isLoading.value = true;
    try {
      String url =
          ApiEndpoint.deleteQuestionReplyUrl(reply_id: replyId.toString());
      final response = await apiService.deleteData(url: url);
      if (response != null && response.data != null) {
        qnaDataController.fetchQnaData(lessonId: lessonId, slug: slug);
        customSnackbar(
            title: "Success",
            message: response.data['message'].toString(),
            type: CustomSnackbarType.success);
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
