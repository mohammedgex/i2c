import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/course/controller/course_details_controller.dart';
import 'package:skill_grow/features/course/controller/course_review_controller.dart';

import 'review_item.dart';
import 'shimmer_loading.dart';

class ReviewsSection extends StatelessWidget {
  final CourseDetalisController courseDetalisController;

  const ReviewsSection({super.key, required this.courseDetalisController});

  @override
  Widget build(BuildContext context) {
    final CourseReviewController courseReviewController = Get.put(
        CourseReviewController(courseDetalisController.course.value!.slug));

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      child: Obx(() {
        if (courseReviewController.isLoading.value) {
          return ShimmerLoading();
        } else {
          return Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: courseReviewController.course.value!.data.length,
                itemBuilder: (context, index) {
                  var reviews = courseReviewController.course.value!.data[index];
                  return ReviewItem(review: reviews);
                },
              ),
              _buildPaginationControls(courseReviewController),
            ],
          );
        }
      }),
    );
  }

  Widget _buildPaginationControls(CourseReviewController courseReviewController) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: courseReviewController.course.value!.pagination.currentPage > 1
                ? () {
                    final prevPage = courseReviewController.course.value!.pagination.currentPage - 1;
                    courseReviewController.fetchCourseReview(prevPage);
                  }
                : null,
            child: GlobalText(text: 'Previous', softWrap: false),
          ),
          Text(
            'Page ${courseReviewController.course.value!.pagination.currentPage} of ${courseReviewController.course.value!.pagination.lastPage}',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          ElevatedButton(
            onPressed: courseReviewController.course.value!.pagination.currentPage <
                    courseReviewController.course.value!.pagination.lastPage
                ? () {
                    final nextPage = courseReviewController.course.value!.pagination.currentPage + 1;
                    courseReviewController.fetchCourseReview(nextPage);
                  }
                : null,
            child: GlobalText(text: 'Next', softWrap: false),
          ),
        ],
      ),
    );
  }
}