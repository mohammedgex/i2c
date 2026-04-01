import 'dart:async';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/categories/controller/category_itme_controller.dart';
import 'package:skill_grow/features/categories/views/category_all_item_view.dart';
import 'package:skill_grow/features/categories/views/category_result_view.dart';
import 'package:skill_grow/features/course/view/all_fresh_course_listView.dart';
import 'package:skill_grow/features/course/view/all_popular_course_listView.dart';
import 'package:skill_grow/features/home/widget/category_section.dart';
import 'package:skill_grow/features/home/widget/fresh_crourse_section.dart';
import 'package:skill_grow/features/home/widget/popular_courses_section.dart';
import 'package:skill_grow/features/home/widget/welcome_sction.dart';
import 'package:skill_grow/features/home/widget/student_reviews_section.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final multiLangualDataController = Get.put(MultiLangualDataController());
    final isLTR = multiLangualDataController.isLTR.value;

    final MainCategoryController categoryController =
        Get.put(MainCategoryController());

    return ColorfulSafeArea(
      bottom: false,
      color: AppColors.scaffoldBackgroundColor,
      child: Scaffold(
        drawer: Drawer(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1),
                  ),
                  child: Text(
                    ' تصنيف الدورات', // "Course Categories" in Arabic
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.titleTextColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(() {
                    if (categoryController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (categoryController.categories.isEmpty) {
                      return Center(
                        child: Text(
                          'No categories available',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: categoryController.categories.length,
                      itemBuilder: (context, index) {
                        final category = categoryController.categories[index];
                        return ListTile(
                          title: Text(category.name),
                          onTap: () {
                            Navigator.of(context).pop();
                            Get.to(() => CategoryResultView(
                                  main_category: category.slug,
                                ));
                          },
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            textDirection: isLTR ? TextDirection.ltr : TextDirection.rtl,
            children: [
              MyCustomAppBar(isShowMenu: true),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: BannerCarousel(
                  banners: const [
                    'assets/images/banner1.jpeg',
                    'assets/images/banner2.jpeg',
                    'assets/images/banner3.jpeg',
                  ],
                ),
              ),
              verticalGap(16.sp),
              // const WelcomeSction(),
              verticalGap(20.sp),
              const StudentReviewsSection(),
              verticalGap(30.sp),
              _buildSectionHeader(
                title: "Categories",
                onViewAllTap: () => Get.to(() => CategoryAllItemView()),
                isLTR: isLTR,
              ),
              verticalGap(16.sp),
              CategorySection(),
              verticalGap(40.sp),
              _buildSectionHeader(
                title: "Popular Courses",
                onViewAllTap: () =>
                    Get.to(() => const AllPopularCourseListview()),
                isLTR: isLTR,
              ),
              verticalGap(16.sp),
              PopularCoursesSection(),
              verticalGap(40.sp),
              _buildSectionHeader(
                title: "Fresh Courses",
                onViewAllTap: () =>
                    Get.to(() => const AllFreshCourseListview()),
                isLTR: isLTR,
              ),
              verticalGap(16.sp),
              FreshCourseSection(),
              verticalGap(20.sp),
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
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
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
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.2,
              ),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}

class BannerCarousel extends StatefulWidget {
  final List<String> banners;

  const BannerCarousel({super.key, required this.banners});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  late final PageController _pageController;
  late final Timer _autoPlayTimer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1);
    _autoPlayTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (!mounted || widget.banners.isEmpty) return;
      final nextPage = (_currentPage + 1) % widget.banners.length;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _autoPlayTimer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160.sp,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.banners.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20.sp),
                child: Image.asset(
                  widget.banners[index],
                  width: double.infinity,
                  height: 160.sp,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        verticalGap(8.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.banners.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: EdgeInsets.symmetric(horizontal: 3.sp),
              width: _currentPage == index ? 18.sp : 8.sp,
              height: 8.sp,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? AppColors.primaryColor
                    : AppColors.activeIconColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(4.sp),
              ),
            );
          }),
        ),
      ],
    );
  }
}
