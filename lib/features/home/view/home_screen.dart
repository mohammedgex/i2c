import 'package:animations/animations.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/categories/views/category_all_item_view.dart';
import 'package:skill_grow/features/home/widget/category_section.dart';
import 'package:skill_grow/features/home/widget/fresh_crourse_section.dart';
import 'package:skill_grow/features/home/widget/popular_courses_section.dart';
import 'package:skill_grow/features/home/widget/welcome_sction.dart';

import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {  MultiLangualDataController multiLangualDataController = Get.put(MultiLangualDataController());
    return ColorfulSafeArea(
      color: AppColors.scaffoldBackgroundColor,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            textDirection: multiLangualDataController.isLTR.value
                ? TextDirection.ltr
                : TextDirection.rtl,
            children: [
              MyCustomAppBar(),
              WelcomeSction(),
              verticalGap(10.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Row(
                  textDirection: multiLangualDataController.isLTR.value
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  children: [
                    GlobalText(
                      text: "Categories",
                      style: TextStyle(
                        color: AppColors.titleTextColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      softWrap: false,
                    ),
                    Spacer(),
                    Bounceable(
                      onTap: () {
                        // bottomNavBarController.updateIndex(0);
                        // Use Navigator.push to navigate with a custom transition
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            transitionDuration: Duration(
                                milliseconds: 900), // Transition duration
                            reverseTransitionDuration: Duration(
                                milliseconds: 900), // Reverse transition
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return CategoryAllItemView(); // Target screen
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              // Hero animation and SharedAxisTransition for the transition
                              return SharedAxisTransition(
                                animation: animation,
                                secondaryAnimation: secondaryAnimation,
                                transitionType:
                                    SharedAxisTransitionType.horizontal,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: GlobalText(
                        text: "See all",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                        softWrap: false,
                      ),
                    ),
                  ],
                ),
              ),
              verticalGap(10.sp),
              CategorySection(),
              verticalGap(30.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Row(
                  textDirection: multiLangualDataController.isLTR.value
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  children: [
                    GlobalText(
                      text: "Popular Courses",
                      style: TextStyle(
                        color: AppColors.titleTextColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      softWrap: false,
                    ),
                    Spacer(),
                    Bounceable(
                      onTap: () {},
                      child: GlobalText(
                        text: "See all",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        softWrap: false,
                      ),
                    ),
                  ],
                ),
              ),
              verticalGap(10.sp),
              PopularCoursesSection(),
              verticalGap(30.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Row(
                  textDirection: multiLangualDataController.isLTR.value
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  children: [
                    GlobalText(
                      text: "Fresh Courses",
                      style: TextStyle(
                        color: AppColors.titleTextColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      softWrap: false,
                    ),
                    Spacer(),
                    Bounceable(
                      onTap: () {},
                      child: GlobalText(
                        text: "See all",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        softWrap: false,
                      ),
                    ),
                  ],
                ),
              ),
              verticalGap(10.sp),
              FreshCrourseSection()
            ],
          ),
        ),
      ),
    );
  }
}
