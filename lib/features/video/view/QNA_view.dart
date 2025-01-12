import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/images/app_image.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/video/widget/view/add_qna_modal.dart';

import '../../../core/constant/constant.dart';

class QNAView extends StatelessWidget {
  const QNAView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Bounceable(
          onTap: () {
            showDialog(
                context: context,
                
                builder: (BuildContext context) {
                  return AddQnaModal();
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
        Container(
            width: double.infinity,
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
                      backgroundImage: AssetImage(AppImage.popularCourseImage1),
                    ),
                    horizontalGap(15.sp),
                    Column(
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
                  text: "How to add multiple download files at the frontend?",
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
            ))
      ],
    );
  }
}
