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
import 'package:skill_grow/features/course/view/all_fresh_course_listView.dart';
import 'package:skill_grow/features/course/view/all_popular_course_listView.dart';
import 'package:skill_grow/features/home/widget/category_section.dart';
import 'package:skill_grow/features/home/widget/fresh_crourse_section.dart';
import 'package:skill_grow/features/home/widget/popular_courses_section.dart';
import 'package:skill_grow/features/home/widget/welcome_sction.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final multiLangualDataController = Get.put(MultiLangualDataController());
    final isLTR = multiLangualDataController.isLTR.value;

    return ColorfulSafeArea(
      bottom: false,
      color: AppColors.scaffoldBackgroundColor,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            textDirection: isLTR ? TextDirection.ltr : TextDirection.rtl,
            children: [
              MyCustomAppBar(),
              const WelcomeSction(),
              verticalGap(10.sp),
              _buildSectionHeader(
                title: "Categories",
                onViewAllTap: () => Get.to(() => CategoryAllItemView()),
                isLTR: isLTR,
              ),
              verticalGap(10.sp),
              CategorySection(),
              verticalGap(30.sp),
              _buildSectionHeader(
                title: "Popular Courses",
                onViewAllTap: () =>
                    Get.to(() => const AllPopularCourseListview()),
                isLTR: isLTR,
              ),
              verticalGap(10.sp),
              PopularCoursesSection(),
              verticalGap(30.sp),
              _buildSectionHeader(
                title: "Fresh Courses",
                onViewAllTap: () =>
                    Get.to(() => const AllFreshCourseListview()),
                isLTR: isLTR,
              ),
              verticalGap(10.sp),
              FreshCrourseSection(),
              verticalGap(10.sp),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required VoidCallback onViewAllTap,
    required bool isLTR,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp),
      child: Row(
        textDirection: isLTR ? TextDirection.ltr : TextDirection.rtl,
        children: [
          GlobalText(
            text: title,
            style: TextStyle(
              color: AppColors.titleTextColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            softWrap: true,
          ),
          const Spacer(),
          Bounceable(
            onTap: onViewAllTap,
            child: GlobalText(
              text: "View All",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
