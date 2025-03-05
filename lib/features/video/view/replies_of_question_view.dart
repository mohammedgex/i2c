import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/icons/app_icon.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import 'package:skill_grow/features/profile/controller/profile_data_cotroller.dart';
import 'package:skill_grow/features/video/controller/create_reply_controller.dart';
import 'package:skill_grow/features/video/controller/qna_data_controller.dart';

import 'package:skill_grow/features/video/widget/add_reply_modal.dart';

import '../../../core/Global/api_endpoint.dart';
import '../../../core/constant/constant.dart';

class RepliesOfQuestionView extends StatelessWidget {
  final int questionId;
  RepliesOfQuestionView({Key? key, required this.questionId});
  ProfileDataCotroller profileDataCotroller = Get.put(ProfileDataCotroller());
 CreateReplyController createReplyController = Get.put(CreateReplyController());
  final QnaDataController qnaDataController = Get.put(QnaDataController());
  DeleteQuestionAndReplyController deleteQuestionAndReplyController = Get.put(DeleteQuestionAndReplyController());

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());

    return Scaffold(
      body: Obx(() {
        if (qnaDataController.isLoading.value) {
          return _buildShimmerLoading();
        }

        // Fetch the question by matching ID
        var qnaQuestion = qnaDataController.qnaData.value?.data
            .firstWhereOrNull((q) => q.id == questionId);

        if (qnaQuestion == null) {
          return Center(
            child:
                Text("Question not found", style: TextStyle(fontSize: 16.sp)),
          );
        }

        var replies = qnaQuestion.replies;

        return ColorfulSafeArea(
          bottom: false,
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
                  // Question UI
                  Container(
                    padding: EdgeInsets.all(15.sp),
                    decoration: BoxDecoration(
                      color: AppColors.nuralItemBackgroundColor,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25.sp,
                              backgroundImage: NetworkImage(
                                  ApiEndpoint.imageUrl +
                                      qnaQuestion.user.image),
                            ),
                            horizontalGap(15.sp),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GlobalText(
                                  text: qnaQuestion.user.name,
                                  style: TextStyle(
                                    color: AppColors.titleTextColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                GlobalText(
                                  text: qnaQuestion.createdAt,
                                  style: TextStyle(
                                    color: AppColors.titleTextColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
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
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            horizontalGap(2.sp),
                            GlobalText(
                              text: "Response",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  verticalGap(10.sp),
                  // Add Reply Button
                  Bounceable(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AddReplyModal(
                            question_id: qnaQuestion.id.toString(),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40.sp,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(7.sp)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, color: Colors.white),
                            horizontalGap(5.sp),
                            GlobalText(
                              text: "Add Response",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  verticalGap(10.sp),
                  // Replies List
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: replies.length,
                    itemBuilder: (context, index) {
                      var reply = replies[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 5.sp),
                        padding: EdgeInsets.all(15.sp),
                        decoration: BoxDecoration(
                          color: AppColors.nuralItemBackgroundColor,
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 25.sp,
                                  backgroundImage: NetworkImage(
                                      ApiEndpoint.imageUrl + reply.user.image),
                                ),
                                horizontalGap(15.sp),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GlobalText(
                                      text: reply.user.name,
                                      style: TextStyle(
                                        color: AppColors.titleTextColor,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    GlobalText(
                                      text: reply.createdAt,
                                      style: TextStyle(
                                        color: AppColors.titleTextColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                if (reply.user.id ==
                                    profileDataCotroller
                                        .userDataResponse.value!.data.id)
                                  IconButton(
                                    onPressed: () {
                                      // Add delete functionality if needed
                                      deleteQuestionAndReplyController.deleteReplay(replyId: reply.id.toString(), lessonId: createReplyController.lessonId!, slug: createReplyController.slug!);
                                    },
                                    icon: SvgPicture.asset(
                                      AppIcon.binIcon,
                                      color: Colors.red,
                                    ),
                                  )
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
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  _buildShimmerLoading() {
    return Shimmer.fromColors(
        baseColor: AppColors.nuralItemBackgroundColor,
        highlightColor: AppColors.shimmerBackgroundColor,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.min, // Prevent infinite expansion
                  children: List.generate(5, (index) {
                    return SizedBox(
                      child: Column(
                        children: [
                          Container(
                            height: 130.sp,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                          ),
                          verticalGap(10.sp),
                          Container(
                            height: 40.sp,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                          ),
                          verticalGap(10.sp),
                          Container(
                            height: 40.sp,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                          ),
                          verticalGap(20.sp),
                        ],
                      ),
                    );
                  })),
            ),
          ),
        ));
  }
}
