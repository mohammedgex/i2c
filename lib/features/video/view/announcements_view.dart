import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/texts.dart';

import '../../../core/constant/constant.dart';
import '../../../core/images/app_image.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class AnnouncementsView extends StatelessWidget {
  const AnnouncementsView({super.key});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    return Scaffold(
      body: ColorfulSafeArea(
        color: AppColors.scaffoldBackgroundColor,
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyCustomAppBar(
                verticalPadding: 0,
                horizontalPadding: 0,
                isShowbackButton: true,
              ),
              verticalGap(10.sp),
              GlobalText(
                text: "Announcements",
                softWrap: true,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              verticalGap(10.sp),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                        width: double.infinity,
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
                                  radius: 20.sp,
                                  backgroundImage:
                                      AssetImage(AppImage.popularCourseImage2),
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
                                      text: "Web Solution Us",
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
                                  "What Course Do You Want To See Next ? Cast Your Vote!",
                              style: TextStyle(
                                color: AppColors.titleTextColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              softWrap: true,
                            ),
                            GlobalText(
                              text:
                                  "After adding multiple files in the backend successfully how do i pull them in frontend i want to have two download buttons After adding multiple files in the backend successfully how doAfter adding multiple files in the \n\nbackend successfully how do i pull them in frontend i want to have two download buttons After adding multiple files in the backend adding multiple files in the backend successfully how do\n\ni pull them in frontend i want to have two download buttons After adding multiple files in the backend successfully how do",
                              softWrap: true,
                              style: TextStyle(
                                color: AppColors.smallTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
