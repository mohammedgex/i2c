import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/widgets/custom_rating_bar.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';

class StudentReviewsSection extends StatefulWidget {
  const StudentReviewsSection({super.key});

  @override
  State<StudentReviewsSection> createState() => _StudentReviewsSectionState();
}

class _StudentReviewsSectionState extends State<StudentReviewsSection> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  final List<_StudentReview> _reviews = const [
    _StudentReview(
      name: 'أحمد مصطفى',
      course: 'دورة صيانة الموبايل - المستوى الأول',
      comment:
          'الدورة ممتازة جداً، بدأت من الصفر وتعلمت أساسيات الهاردوير والـسوفت وير خطوة بخطوة.',
      rating: 4.8,
    ),
    _StudentReview(
      name: 'سارة علي',
      course: 'دورة احتراف صيانة الموبايل',
      comment:
          'الشرح واضح جداً والتطبيق العملي على أعطال حقيقية خلاني جاهز أبدأ شغل فوراً.',
      rating: 5.0,
    ),
    _StudentReview(
      name: 'محمد إبراهيم',
      course: 'دورة أعطال متقدمة في صيانة الموبايل',
      comment:
          'تفاصيل الأعطال المعقدة وطرق التشخيص في الدورة فرقت معايا جداً في الشغل اليومي.',
      rating: 4.9,
    ),
  ];

  final MultiLangualDataController _multiLangualDataController =
      Get.put(MultiLangualDataController());

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLTR = _multiLangualDataController.isLTR.value;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          GlobalText(
            text: 'آراء طلابنا',
            softWrap: true,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: AppColors.titleTextColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
            ),
          ),
          SizedBox(height: 10.sp),
          GlobalText(
            text: 'تجارب حقيقية من طلاب دورات صيانة الموبايل',
            softWrap: true,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: AppColors.smallTextColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 20.sp),
          SizedBox(
            height: 190.sp,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _reviews.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final review = _reviews[index];
                return _buildReviewCard(review, isLTR);
              },
            ),
          ),
          SizedBox(height: 12.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _reviews.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                height: 8.h,
                width: _currentPage == index ? 18.w : 8.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: _currentPage == index
                      ? AppColors.primaryColor
                      : AppColors.inactiveIconColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(_StudentReview review, bool isLTR) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 1.0;
        if (_pageController.position.haveDimensions) {
          final currentPage =
              _pageController.page ?? _pageController.initialPage.toDouble();
          value = currentPage - _currentPage;
          value = (1 - (value.abs() * 0.15)).clamp(0.85, 1.0).toDouble();
        }

        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.sp),
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: AppColors.cardBackgroundColor,
          borderRadius: BorderRadius.circular(20.sp),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColorLight,
              blurRadius: 14.sp,
              offset: Offset(0, 6.sp),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              isLTR ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Row(
              textDirection: isLTR ? TextDirection.ltr : TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GlobalText(
                    text: review.name,
                    softWrap: true,
                    style: TextStyle(
                      color: AppColors.titleTextColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(width: 8.sp),
                CustomRatingBar(
                  rating: review.rating,
                  maxRating: 5,
                  iconSize: 16.sp,
                  filledColor: AppColors.activeIconColor,
                  unfilledColor: AppColors.inactiveIconColor,
                ),
              ],
            ),
            SizedBox(height: 4.sp),
            GlobalText(
              text: review.course,
              softWrap: true,
              style: TextStyle(
                color: AppColors.smallTextColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.sp),
            Expanded(
              child: GlobalText(
                text: review.comment,
                softWrap: true,
                style: TextStyle(
                  color: AppColors.smallTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StudentReview {
  final String name;
  final String course;
  final String comment;
  final double rating;

  const _StudentReview({
    required this.name,
    required this.course,
    required this.comment,
    required this.rating,
  });
}
