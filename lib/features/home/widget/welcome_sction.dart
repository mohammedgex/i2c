import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/learining/view/learing_view.dart';
import 'package:skill_grow/features/profile/controller/profile_data_cotroller.dart';

import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class WelcomeSction extends StatelessWidget {
  const WelcomeSction({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileDataCotroller profileDataCotroller = Get.put(ProfileDataCotroller());
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.sp),
      child: Obx(() {
        if (profileDataCotroller.isLoading.value) {
          return Shimmer.fromColors(
              baseColor: AppColors.shimmerBackgroundColor,
              highlightColor: AppColors.nuralItemBackgroundColor,
              child: Container(
                  width: double.infinity,
                  height: 100.sp,
                  decoration: BoxDecoration(
                    color: AppColors.nuralItemBackgroundColor,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(20.sp),
                      child: Row(
                        textDirection: multiLangualDataController.isLTR.value
                            ? TextDirection.ltr
                            : TextDirection.rtl,
                      ))));
        } else {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryColor.withOpacity(0.08),
                  AppColors.secondaryColor.withOpacity(0.04),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24.sp),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColorLight,
                  blurRadius: 10.sp,
                  offset: Offset(0, 3.sp),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(24.sp),
              child: Row(
                textDirection: multiLangualDataController.isLTR.value
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                children: [
                  Expanded(
                    child: Column(
                      textDirection: multiLangualDataController.isLTR.value
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "مرحباً,${profileDataCotroller.userDataResponse.value?.data.name} 👋",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.titleTextColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            height: 1.4,
                            letterSpacing: 0.3,
                          ),
                        ),
                        verticalGap(4.sp),
                        GlobalText(
                          softWrap: true,
                          text: "Let’s start learning!",
                          style: TextStyle(
                            color: AppColors.smallTextColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  FittedBox(
                    child: Bounceable(
                        onTap: () {
                          Get.to(() => LearingView(
                                isShowbackButton: true,
                              ));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.sp,
                            vertical: 8.sp,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: AppColors.primaryGradient,
                            ),
                            borderRadius: BorderRadius.circular(12.sp),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryColor.withOpacity(0.3),
                                blurRadius: 8.sp,
                                offset: Offset(0, 4.sp),
                              ),
                            ],
                          ),
                          child: Row(
                            textDirection:
                                multiLangualDataController.isLTR.value
                                    ? TextDirection.ltr
                                    : TextDirection.rtl,
                            children: [
                              GlobalText(
                                softWrap: false,
                                text: "Continue Learning",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.2,
                                ),
                              ),
                              horizontalGap(6.sp),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 12.sp,
                              )
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
