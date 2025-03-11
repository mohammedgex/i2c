// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/categories/views/category_result_view.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';
import '../../search/controller/search_data_controller.dart';
import '../controller/category_itme_controller.dart';

class CategoryAllItemView extends StatelessWidget {
  CategoryAllItemView({super.key});

  final MultiLangualDataController multiLangualDataController =
      Get.put(MultiLangualDataController());
  final MainCategoryController controller = Get.put(MainCategoryController());
  SearchDataController searchDataController = Get.put(SearchDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyCustomAppBar(
                horizontalPadding: 0,
                verticalPadding: 0.sp,
                isShowbackButton: true,
              ),
              SizedBox(height: 10.sp),
              GlobalText(
                text: 'Categories',
                style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.titleTextColor),
                softWrap: false,
              ),
              SizedBox(height: 10.sp),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return _buildShimmerLoading();
                  } else if (controller.categories.isEmpty) {
                    return Center(
                      child: GlobalText(
                        softWrap: true,
                        text: 'No categories available',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.smallTextColor,
                        ),
                      ),
                    );
                  } else {
                    return _buildCategoryGrid();
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerLoading() {
    return Flexible(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 20.sp,
            crossAxisSpacing: 20.sp,
            childAspectRatio: 1),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: AppColors.nuralItemBackgroundColor,
            highlightColor: AppColors.shimmerBackgroundColor,
            child: Column(
              children: [
                Container(
                  height: 50.sp,
                  width: 50.sp,
                  decoration: BoxDecoration(
                    color: AppColors.nuralItemBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(height: 3.sp),
                Container(
                  height: 12.sp,
                  width: 50.sp,
                  decoration: BoxDecoration(
                    color: AppColors.nuralItemBackgroundColor,
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoryGrid() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 20.sp,
          crossAxisSpacing: 20.sp,
          childAspectRatio: 1,
        ),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          final category = controller.categories[index];
          return Bounceable(
            onTap: () {
              Get.to(() => CategoryResultView(main_category: category.slug));
            },
            child: Column(
              children: [
                Container(
                  height: 50.sp,
                  width: 50.sp,
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: AppColors.nuralItemBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.network(
                      ApiEndpoint.BASE_URL + category.icon,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.image_not_supported,
                        color: AppColors.smallTextColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 3.sp),
                GlobalText(
                  text: category.name,
                  style: TextStyle(
                    color: AppColors.smallTextColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  softWrap: false,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
