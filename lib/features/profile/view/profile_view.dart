import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/images/app_image.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import 'package:skill_grow/features/profile/view/account_setting_landing_view.dart';
import 'package:skill_grow/features/profile/view/faq_view.dart';
import 'package:skill_grow/features/profile/view/privecy_policy_view.dart';
import 'package:skill_grow/features/profile/view/terms_and_condition_view.dart';

import '../../../core/widgets/texts.dart';
import '../../language/view/language_list_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    return Scaffold(
      body: ColorfulSafeArea(
        bottom: false,
        color: AppColors.scaffoldBackgroundColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: multiLangualDataController.isLTR.value
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              children: [
                MyCustomAppBar(
                  horizontalPadding: 0,
                  verticalPadding: 0.sp,
                  isShowbackButton: false,
                ),
                Container(
                  width: double.infinity,
                  height: 200.sp,
                  decoration: BoxDecoration(
                    // color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      textDirection: multiLangualDataController.isLTR.value
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 120.sp,
                          height: 120.sp,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.mainRedColor,
                            image: DecorationImage(
                                image: AssetImage(AppImage.profile),
                                fit: BoxFit.contain),
                          ),
                        ),
                        verticalGap(5.sp),
                        GlobalText(
                          text: 'Meharab Islam',
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                          softWrap: true,
                        ),
                        GlobalText(
                          text: 'student@gmail.com',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w300),
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                ),
                verticalGap(20.sp),
                GlobalText(text: "Language and Currency", softWrap: true),
                verticalGap(10.sp),
                Bounceable(
                  onTap: () {
                    Get.to(() => LanguageListView());
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.sp,
                    decoration: BoxDecoration(
                      color: AppColors.nuralItemBackgroundColor,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: Row(
                      textDirection: multiLangualDataController.isLTR.value
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      children: [
                        horizontalGap(10.sp),
                        GlobalText(text: "Language", softWrap: true),
                        GlobalText(text: "(English)", softWrap: true),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.titleTextColor,
                          size: 15.sp,
                        ),
                        horizontalGap(10.sp),
                      ],
                    ),
                  ),
                ),
                verticalGap(10.sp),
                Container(
                  width: double.infinity,
                  height: 50.sp,
                  decoration: BoxDecoration(
                    color: AppColors.nuralItemBackgroundColor,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Row(
                    textDirection: multiLangualDataController.isLTR.value
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                    children: [
                      horizontalGap(10.sp),
                      GlobalText(text: "Currency", softWrap: true),
                      GlobalText(text: "(USD)", softWrap: true),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.titleTextColor,
                        size: 15.sp,
                      ),
                      horizontalGap(10.sp),
                    ],
                  ),
                ),
                verticalGap(20.sp),
                GlobalText(text: "Account", softWrap: true),
                verticalGap(10.sp),
                Bounceable(
                  onTap: () {
                    Get.to(() => AccountSettingLandingView());
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.sp,
                    decoration: BoxDecoration(
                      color: AppColors.nuralItemBackgroundColor,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: Row(
                      textDirection: multiLangualDataController.isLTR.value
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      children: [
                        horizontalGap(10.sp),
                        GlobalText(text: "Account Setting", softWrap: true),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.titleTextColor,
                          size: 15.sp,
                        ),
                        horizontalGap(10.sp),
                      ],
                    ),
                  ),
                ),
                verticalGap(20.sp),
                GlobalText(text: "Help and Support", softWrap: true),
                verticalGap(10.sp),
                Container(
                  width: double.infinity,
                  height: 50.sp,
                  decoration: BoxDecoration(
                    color: AppColors.nuralItemBackgroundColor,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Row(
                    textDirection: multiLangualDataController.isLTR.value
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                    children: [
                      horizontalGap(10.sp),
                      GlobalText(text: "About Skillgrow", softWrap: true),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.titleTextColor,
                        size: 15.sp,
                      ),
                      horizontalGap(10.sp),
                    ],
                  ),
                ),
                verticalGap(10.sp),
                Bounceable(
                  onTap: () {
                    Get.to(() => FAQView());
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.sp,
                    decoration: BoxDecoration(
                      color: AppColors.nuralItemBackgroundColor,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: Row(
                      textDirection: multiLangualDataController.isLTR.value
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      children: [
                        horizontalGap(10.sp),
                        GlobalText(
                            text: "Frequently Asked Questions", softWrap: true),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.titleTextColor,
                          size: 15.sp,
                        ),
                        horizontalGap(10.sp),
                      ],
                    ),
                  ),
                ),
                verticalGap(10.sp),
                Bounceable(
                  onTap: () {
                    Get.to(() => TermsAndConditionView());
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.sp,
                    decoration: BoxDecoration(
                      color: AppColors.nuralItemBackgroundColor,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: Row(
                      textDirection: multiLangualDataController.isLTR.value
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      children: [
                        horizontalGap(10.sp),
                        GlobalText(
                            text: "Terms and Conditions", softWrap: true),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.titleTextColor,
                          size: 15.sp,
                        ),
                        horizontalGap(10.sp),
                      ],
                    ),
                  ),
                ),
                verticalGap(10.sp),
                Bounceable(
                  onTap: () {
                    Get.to(() => PrivecyPolicyView());
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.sp,
                    decoration: BoxDecoration(
                      color: AppColors.nuralItemBackgroundColor,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: Row(
                      textDirection: multiLangualDataController.isLTR.value
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      children: [
                        horizontalGap(10.sp),
                        GlobalText(text: "Privacy Policy", softWrap: true),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.titleTextColor,
                          size: 15.sp,
                        ),
                        horizontalGap(10.sp),
                      ],
                    ),
                  ),
                ),
                verticalGap(10.sp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
