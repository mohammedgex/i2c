// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/custom_rating_bar.dart';
import 'package:skill_grow/features/course/controller/popular_course_controller.dart';
import '../../../core/widgets/texts.dart';
import '../../course/view/course_details.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class PopularCoursesSection extends StatelessWidget {
  PopularCoursesSection({super.key});

  final PopularCourseController popularCourseItemController =
      Get.put(PopularCourseController());

  @override
  Widget build(BuildContext context) {
    final MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());

    return Padding(
      padding: EdgeInsets.only(left: 0.sp),
      child: Obx(() {
        if (popularCourseItemController.isLoading.value) {
          return _buildShimmerEffect();
        } else {
          return _buildCourseList(multiLangualDataController);
        }
      }),
    );
  }

  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: AppColors.nuralItemBackgroundColor,
      highlightColor: AppColors.shimmerBackgroundColor,
      child: SizedBox(
        height: 171.sp,
        child: ListView.builder(
            // shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 10.sp),
                child: Column(
                    textDirection: multiLangualDataController.isLTR.value
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 101.sp,
                        width: 159.sp,
                        decoration: BoxDecoration(
                          color: AppColors.nuralItemBackgroundColor,
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                      verticalGap(5.sp),
                      Container(
                        height: 8.sp,
                        width: 150.sp,
                        decoration: BoxDecoration(
                          color: AppColors.nuralItemBackgroundColor,
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                      verticalGap(5.sp),
                      Container(
                        height: 8.sp,
                        width: 100.sp,
                        decoration: BoxDecoration(
                          color: AppColors.nuralItemBackgroundColor,
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                      verticalGap(7.sp),
                      Container(
                        height: 8.sp,
                        width: 150.sp,
                        decoration: BoxDecoration(
                          color: AppColors.nuralItemBackgroundColor,
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                      Spacer(),
                      Row(
                          textDirection: multiLangualDataController.isLTR.value
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                          children: [
                            Container(
                              height: 20.sp,
                              width: 100.sp,
                              decoration: BoxDecoration(
                                color: AppColors.nuralItemBackgroundColor,
                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                            ),
                            horizontalGap(5.sp),
                            Container(
                              height: 20.sp,
                              width: 50.sp,
                              decoration: BoxDecoration(
                                color: AppColors.nuralItemBackgroundColor,
                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                            ),
                          ])
                    ]),
              );
            }),
      ),
    );
  }

  Widget _buildCourseList(
      MultiLangualDataController multiLangualDataController) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          popularCourseItemController.courses.length >= 4
              ? 4
              : popularCourseItemController.courses.length,
          (index) => _buildCourseItem(index, multiLangualDataController),
        ),
      ),
    );
  }

  Widget _buildCourseItem(
      int index, MultiLangualDataController multiLangualDataController) {
    final course = popularCourseItemController.courses[index];

    return Bounceable(
      onTap: () => Get.to(() => CourseDetailsView(slug: course.slug)),
      child: Container(
        width: 200.sp,
        margin: EdgeInsets.symmetric(horizontal: 7.5.sp),
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          color: AppColors.cardBackgroundColor,
          borderRadius: BorderRadius.circular(24.sp),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColorLight,
              blurRadius: 16.sp,
              offset: Offset(0, 4.sp),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCourseImage(course.thumbnail),
            verticalGap(12.sp),
            _buildCourseTitle(course.title),
            verticalGap(10.sp),
            _buildInstructorInfo(course),
            verticalGap(10.sp),
            _buildCourseRatingAndPrice(course),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseImage(String thumbnail) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.sp),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColorLight,
              blurRadius: 8.sp,
              offset: Offset(0, 4.sp),
            ),
          ],
        ),
        child: Image.network(
          ApiEndpoint.BASE_URL + thumbnail,
          fit: BoxFit.cover,
          height: 120.sp,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget _buildCourseTitle(String title) {
    return GlobalText(
      text: title,
      style: TextStyle(
        color: AppColors.titleTextColor,
        fontSize: 17.sp,
        fontWeight: FontWeight.w700,
        height: 1.4,
        letterSpacing: 0.2,
      ),
      softWrap: true,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildInstructorInfo(dynamic course) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: GlobalText(
            text: course.instructor.name,
            style: TextStyle(
              color: AppColors.smallTextColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              height: 1.3,
            ),
            softWrap: true,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        GlobalText(
          text: " | ",
          style: TextStyle(
            color: AppColors.smallTextColor.withOpacity(0.5),
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
          softWrap: true,
        ),
        Expanded(
          flex: 1,
          child: GlobalText(
            text: "${course.students} Students",
            style: TextStyle(
              color: AppColors.smallTextColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              height: 1.3,
            ),
            softWrap: true,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildCourseRatingAndPrice(dynamic course) {
    return Wrap(
      spacing: 10.sp,
      runSpacing: 1.sp,
      children: [
        CustomRatingBar(
          rating: course.averageRating.toDouble(),
          maxRating: 5,
          iconSize: 13.sp,
          filledColor: AppColors.activeIconColor,
          unfilledColor: AppColors.activeIconColor,
        ),
        Row(
          children: [
            course.discount == 0
                ? Container()
                : GlobalText(
                    text: "${course.discount}",
                    style: TextStyle(
                      color: AppColors.smallTextColor.withOpacity(0.6),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.lineThrough,
                      height: 1.3,
                    ),
                    softWrap: true,
                  ),
            horizontalGap(6.sp),
            GlobalText(
              text: "${course.price}",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                height: 1.3,
              ),
              softWrap: true,
            ),
          ],
        )
      ],
    );
  }
}
