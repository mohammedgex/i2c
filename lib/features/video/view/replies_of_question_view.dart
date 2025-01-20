import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/icons/app_icon.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import 'package:skill_grow/features/video/model/qna_data_model.dart';
import 'package:skill_grow/features/video/widget/add_reply_modal.dart';

import '../../../core/Global/api_endpoint.dart';
import '../../../core/constant/constant.dart';

class RepliesOfQuestionView extends StatelessWidget {
  final QnaQuestion qnaQuestion;
  const RepliesOfQuestionView({super.key, required this.qnaQuestion});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    return Scaffold(
      body: ColorfulSafeArea(
        color: AppColors.scaffoldBackgroundColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              textDirection: multiLangualDataController.isLTR.value
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              children: [
                MyCustomAppBar(
                  verticalPadding: 0,
                  horizontalPadding: 0,
                  isShowbackButton: true,
                  isShowNotification: false,
                ),
                verticalGap(10.sp),
                Container(
                    padding: EdgeInsets.all(15.sp),
                    decoration: BoxDecoration(
                      color: AppColors.nuralItemBackgroundColor,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: Column(
                      textDirection: multiLangualDataController.isLTR.value
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          textDirection: multiLangualDataController.isLTR.value
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                          children: [
                            CircleAvatar(
                              radius: 25.sp,
                              backgroundImage: NetworkImage(
                                  ApiEndpoint.imageUrl +
                                      qnaQuestion.user.image),
                            ),
                            horizontalGap(15.sp),
                            Column(
                              textDirection:
                                  multiLangualDataController.isLTR.value
                                      ? TextDirection.ltr
                                      : TextDirection.rtl,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GlobalText(
                                  text: qnaQuestion.user.name,
                                  style: TextStyle(
                                    color: AppColors.titleTextColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  softWrap: false,
                                ),
                                GlobalText(
                                  text: qnaQuestion.createdAt,
                                  style: TextStyle(
                                    color: AppColors.titleTextColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  softWrap: false,
                                ),
                              ],
                            ),
                          ],
                        ),
                        verticalGap(10.sp),
                        GlobalText(
                          text: qnaQuestion.question,
                          style: TextStyle(
                            color: AppColors.titleTextColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          softWrap: true,
                        ),
                        GlobalText(
                          text: qnaQuestion.description,
                          softWrap: true,
                          style: TextStyle(
                            color: AppColors.smallTextColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        verticalGap(5.sp),
                        Row(
                          textDirection: multiLangualDataController.isLTR.value
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                          children: [
                            Text(
                              qnaQuestion.repliesCount.toString(),
                              softWrap: true,
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            horizontalGap(2.sp),
                            GlobalText(
                              text: "Response",
                              softWrap: true,
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                verticalGap(10.sp),
                Bounceable(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AddReplyModal(
                            question_id: qnaQuestion.id.toString(),
                          );
                        });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 40.sp,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(7.sp)),
                    child: Center(
                      child: Row(
                        textDirection: multiLangualDataController.isLTR.value
                            ? TextDirection.ltr
                            : TextDirection.rtl,
                        children: [
                          Spacer(),
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          horizontalGap(5.sp),
                          GlobalText(
                            text: "Add Response",
                            softWrap: true,
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.sp),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
                verticalGap(10.sp),
                Flexible(
                  child: Column(
                    children:
                        List.generate(qnaQuestion.replies.length, (index) {
                      var reply = qnaQuestion.replies[index];
                      return Container(
                          margin: EdgeInsets.only(bottom: 5.sp),
                          padding: EdgeInsets.all(15.sp),
                          decoration: BoxDecoration(
                            color: AppColors.nuralItemBackgroundColor,
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          child: Column(
                            textDirection:
                                multiLangualDataController.isLTR.value
                                    ? TextDirection.ltr
                                    : TextDirection.rtl,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                textDirection:
                                    multiLangualDataController.isLTR.value
                                        ? TextDirection.ltr
                                        : TextDirection.rtl,
                                children: [
                                  CircleAvatar(
                                    radius: 25.sp,
                                    backgroundImage: NetworkImage(
                                        ApiEndpoint.imageUrl +
                                            reply.user.image),
                                  ),
                                  horizontalGap(15.sp),
                                  Column(
                                    textDirection:
                                        multiLangualDataController.isLTR.value
                                            ? TextDirection.ltr
                                            : TextDirection.rtl,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GlobalText(
                                        text: reply.user.name,
                                        style: TextStyle(
                                          color: AppColors.titleTextColor,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        softWrap: false,
                                      ),
                                      GlobalText(
                                        text: reply.createdAt,
                                        style: TextStyle(
                                          color: AppColors.titleTextColor,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        softWrap: false,
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        AppIcon.binIcon,
                                        color: Colors.red,
                                      ))
                                ],
                              ),
                              verticalGap(10.sp),
                              GlobalText(
                                text: reply.reply,
                                style: TextStyle(
                                  color: AppColors.titleTextColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                softWrap: true,
                              ),
                            ],
                          ));
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
