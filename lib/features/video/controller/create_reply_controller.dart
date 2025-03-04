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
  String? lessonId;
  String? slug;
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

  // Create reply function
  Future<void> createReply({required String questionId}) async {
    isLoading.value = true;
    try {
      final requestModel = CreateReplyRequestModel(
        reply: replyController.text.trim(),
      );

      String url = ApiEndpoint.addQuestionReplyUrl(
        question_id: questionId,
        lesson_id: lessonId!,
      );

      final response =
          await CreateReplyService().createReply(requestModel, url);

      // Check if the response is not null
      if (response.status == 'success') {
        // Handle success
        qnaDataController.update(); // Refresh the Q&A data
        customSnackbar(
          title: "Success",
          message: response.message, // Use a fallback message
          type: CustomSnackbarType.success,
        );
        qnaDataController.fetchQnaData(lessonId: lessonId!, slug: slug!);
        // Clear the reply field and close the dialog

        replyController.clear();
        Get.back();
      } else {
        // Handle API error
        customSnackbar(
          title: "Error",
          message: response.message, // Use a fallback message
          type: CustomSnackbarType.failed,
        );
      }
    } catch (e) {
      log("Error creating reply: $e");
      customSnackbar(
        title: "Error",
        message: "An unexpected error occurred. Please try again.",
        type: CustomSnackbarType.failed,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
