import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_grow/features/video/controller/qna_data_controller.dart';
import 'package:skill_grow/features/video/model/create_reply_model.dart';
import 'package:skill_grow/features/video/service/create_reply_service.dart';

import '../../../core/Global/api_endpoint.dart';
import '../../../core/widgets/snackbar.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class CreateReplyController extends GetxController {
  String lessonId = "";
  String slug = "";
  // Form key
  final formKey = GlobalKey<FormState>();

  QnaDataController qnaDataController = Get.find<QnaDataController>();

  // Text controllers
  final TextEditingController replyController = TextEditingController();

  // State management
  var isLoading = false.obs;

  // Email validation

  String? validateReply(String? value) {
    if (value == null || value.isEmpty) {
      return translatedText('Reply is required');
    }

    return null;
  }

  @override
  void dispose() {
    replyController.dispose();
    super.dispose();
  }

  // Login function
  Future<void> createReply(String question_id) async {
    isLoading.value = true;
    try {
      final requestModel = CreateReplyRequestModel(
        reply: replyController.text.trim(),
      );

      String url = ApiEndpoint.addQuestionReplyUrl(question_id: question_id, lesson_id: lessonId);

      final response =
          await CreateReplyService().createReply(requestModel, url);

      if (response.status == 'success') {
        // Handle success, navigate to home
        qnaDataController.update();
        customSnackbar(
            title: "Success",
            message: response.message.toString(),
            type: CustomSnackbarType.success);
      }
      replyController.clear();
      Get.back();
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
