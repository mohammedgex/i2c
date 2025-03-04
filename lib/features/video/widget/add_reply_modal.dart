import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/widgets/button.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/video/controller/create_reply_controller.dart';
import 'package:skill_grow/widgets/text_input.dart';
import '../../../core/constant/constant.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class AddReplyModal extends StatelessWidget {
  final String question_id;
  const AddReplyModal({super.key, required this.question_id});

  @override
  Widget build(BuildContext context) {
    CreateReplyController createReplyController =
        Get.put(CreateReplyController());
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp), // Customize the radius
      ),
      content: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 400.sp, maxWidth: 400.sp),
        child: Form(
          key: createReplyController.formKey,
          child: Column(
            textDirection: multiLangualDataController.isLTR.value
                ? TextDirection.ltr
                : TextDirection.rtl,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalText(
                text: "Question",
                softWrap: true,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              verticalGap(10.sp),
              CustomTextField(
                controller: createReplyController.replyController,
                hint: "Reply",
                keyName: "Reply",
                inputType: TextInputType.text,
                validator: (value) =>
                    createReplyController.validateReply(value),
              ),
              verticalGap(10.sp),
              Row(
                textDirection: multiLangualDataController.isLTR.value
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                children: [
                  Flexible(
                    child: GlobalButton(
                      height: 40.sp,
                      width: double.infinity,
                      color: AppColors.mainRedColor,
                      text: "Cancel",
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ),
                  horizontalGap(10.sp),
                  Flexible(
                    child: Obx(() {
                      if (createReplyController.isLoading.value) {
                        return SizedBox(
                          height: 40.sp,
                          width: double.infinity,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        return GlobalButton(
                            height: 40.sp,
                            width: double.infinity,
                            text: "Create",
                            onTap: () {
                              if (createReplyController.formKey.currentState!
                                  .validate()) {
                                createReplyController.createReply(
                                    questionId: question_id);
                              }
                            });
                      }
                    }),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
