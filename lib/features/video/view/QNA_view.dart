import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/images/app_image.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/video/controller/qna_data_controller.dart';
import 'package:skill_grow/features/video/widget/add_qna_modal.dart';

import '../../../core/constant/constant.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class QNAView extends StatelessWidget {
  const QNAView({super.key});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    QnaDataController qnaDataController = Get.put(QnaDataController());
    return Obx(() {
      if (qnaDataController.isLoading.value) {
        return Shimmer.fromColors(
          baseColor: AppColors.nuralItemBackgroundColor,
          highlightColor: AppColors.shimmerBackgroundColor,
          child: Column(children: [
            Container(
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
                      text: "Add Question",
                      softWrap: true,
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    ),
                    Spacer(),
                  ],
                ),
              ),
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
                          backgroundImage:
                              AssetImage(AppImage.popularCourseImage1),
                        ),
                        horizontalGap(15.sp),
                        Column(
                          textDirection: multiLangualDataController.isLTR.value
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GlobalText(
                              text: "Sathish",
                              style: TextStyle(
                                color: AppColors.titleTextColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              softWrap: true,
                            ),
                            GlobalText(
                              text: "Nov 20, 4:15PM",
                              style: TextStyle(
                                color: AppColors.titleTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              softWrap: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                    verticalGap(10.sp),
                    GlobalText(
                      text:
                          "How to add multiple download files at the frontend?",
                      style: TextStyle(
                        color: AppColors.titleTextColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      softWrap: true,
                    ),
                    GlobalText(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, in pharetra",
                      softWrap: true,
                      style: TextStyle(
                        color: AppColors.smallTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    verticalGap(5.sp),
                    GlobalText(
                      text: "1 response",
                      softWrap: true,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )),
          ]),
        );
      } else if (qnaDataController.qnaData.value == null) {
        return Column(
          textDirection: multiLangualDataController.isLTR.value
              ? TextDirection.ltr
              : TextDirection.rtl,
          children: [
            Center(
              child: GlobalText(text: "No question found", softWrap: true),
            ),
          ],
        );
      } else {
        return Column(
          textDirection: multiLangualDataController.isLTR.value
              ? TextDirection.ltr
              : TextDirection.rtl,
          children: [
            Bounceable(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddQnaModal(
                        
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
                        text: "Add Question",
                        softWrap: true,
                        style: TextStyle(color: Colors.white, fontSize: 15.sp),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            verticalGap(10.sp),
            Column(
                textDirection: multiLangualDataController.isLTR.value
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                    qnaDataController.qnaData.value!.data.length, (index) {
                  var qna = qnaDataController.qnaData.value!.data[index];
                  return Container(
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
                            textDirection:
                                multiLangualDataController.isLTR.value
                                    ? TextDirection.ltr
                                    : TextDirection.rtl,
                            children: [
                              CircleAvatar(
                                radius: 25.sp,
                                backgroundImage: NetworkImage(
                                    ApiEndpoint.imageUrl + qna.user.image),
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
                                    text: qna.user.name,
                                    style: TextStyle(
                                      color: AppColors.titleTextColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    softWrap: true,
                                  ),
                                  GlobalText(
                                    text: "Nov 20, 4:15PM",
                                    style: TextStyle(
                                      color: AppColors.titleTextColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          verticalGap(10.sp),
                          GlobalText(
                            text: qna.question,
                            style: TextStyle(
                              color: AppColors.titleTextColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            softWrap: true,
                          ),
                          GlobalText(
                            text: qna.description,
                            softWrap: true,
                            style: TextStyle(
                              color: AppColors.smallTextColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          verticalGap(5.sp),
                          Row(
                            textDirection:
                                multiLangualDataController.isLTR.value
                                    ? TextDirection.ltr
                                    : TextDirection.rtl,
                            children: [
                              Text(
                                qna.repliesCount.toString(),
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
                      ));
                }))
          ],
        );
      }
    });
  }
}
