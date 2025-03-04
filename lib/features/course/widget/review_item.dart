import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/custom_rating_bar.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/course/model/course_review_model.dart';

class ReviewItem extends StatelessWidget {
  final Review review;

  const ReviewItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(color: AppColors.nuralItemBackgroundColor),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundImage: NetworkImage(ApiEndpoint.imageUrl + review.avatar),
          ),
          horizontalGap(10.sp),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalText(
                text: review.name,
                softWrap: true,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.titleTextColor,
                ),
              ),
              CustomRatingBar(
                rating: review.rating.toDouble(),
                filledColor: AppColors.primaryColor,
                unfilledColor: AppColors.activeIconColor,
                iconSize: 18.sp,
              ),
              GlobalText(
                text: review.review,
                softWrap: true,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w300,
                  color: AppColors.titleTextColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}