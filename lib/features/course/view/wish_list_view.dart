import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/Global/api_endpoint.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/custom_rating_bar.dart';
import 'package:skill_grow/features/course/controller/wish_list_controller.dart';
import 'package:skill_grow/features/course/view/course_details.dart';
import 'package:skill_grow/features/learining/widget/ernrollerd_course_loaing_ui.dart';
import '../../../core/colors/app_colors.dart';
import '../../../core/constant/constant.dart';
import '../../../core/widgets/texts.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    WishListController searchDataController = Get.put(WishListController());
    return Scaffold(
      body: Obx(() {
        if (searchDataController.isLoading.value) {
          return const Center(child: ErnrollerdCourseLoaingUi());
        } else {
          if (searchDataController.wishList.isEmpty) {
            return Center(
                child: GlobalText(
              text: "No Data Found",
              softWrap: true,
            ));
          } else {
            return ColorfulSafeArea(
              bottom: false,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: Column(
                  textDirection: multiLangualDataController.isLTR.value
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyCustomAppBar(
                      horizontalPadding: 0,
                      verticalPadding: 0,
                      isShowbackButton: true,
                    ),
                    // verticalGap(5.sp),
                    GlobalText(
                      text: 'Wish List',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.titleTextColor),
                      softWrap: false,
                    ),
                    verticalGap(10.sp),
                    Expanded(
                      child: ListView.builder(
                          itemCount: searchDataController.wishList.length,
                          itemBuilder: (context, index) {
                            return Bounceable(
                              onTap: () {
                                Get.to(() => CourseDetailsView(
                                    slug: searchDataController
                                        .wishList[index].slug));
                              },
                              child: Container(
                                  margin: EdgeInsets.only(bottom: 10.sp),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    // border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(12.sp),
                                    color: AppColors.nuralItemBackgroundColor,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(3.sp),
                                    child: Row(
                                      textDirection:
                                          multiLangualDataController.isLTR.value
                                              ? TextDirection.ltr
                                              : TextDirection.rtl,
                                      children: [
                                        Container(
                                          height: 60.sp,
                                          width: 103.sp,
                                          decoration: BoxDecoration(),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            child: Image.network(
                                              ApiEndpoint.imageUrl +
                                                  searchDataController
                                                      .wishList[index]
                                                      .thumbnail,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        horizontalGap(10.sp),
                                        SizedBox(
                                          width: 235.w,
                                          child: Column(
                                            textDirection:
                                                multiLangualDataController
                                                        .isLTR.value
                                                    ? TextDirection.ltr
                                                    : TextDirection.rtl,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              GlobalText(
                                                text: searchDataController
                                                    .wishList[index].title,
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors
                                                        .titleTextColor),
                                                softWrap: true,
                                              ),
                                              verticalGap(3.sp),
                                              GlobalText(
                                                  text:
                                                      '${searchDataController.wishList[index].instructor.name} | ${searchDataController.wishList[index].students} Students',
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: AppColors
                                                          .titleTextColor),
                                                  softWrap: true),
                                              verticalGap(2.sp),
                                              Row(
                                                textDirection:
                                                    multiLangualDataController
                                                            .isLTR.value
                                                        ? TextDirection.ltr
                                                        : TextDirection.rtl,
                                                children: [
                                                  CustomRatingBar(
                                                    rating: searchDataController
                                                        .wishList[index]
                                                        .averageRating
                                                        .toDouble(),
                                                    maxRating: 5,
                                                    iconSize: 15.sp,
                                                    filledColor: AppColors
                                                        .activeIconColor,
                                                    unfilledColor: AppColors
                                                        .activeIconColor,
                                                  ),
                                                  Spacer(),
                                                  Row(
                                                    textDirection:
                                                        multiLangualDataController
                                                                .isLTR.value
                                                            ? TextDirection.ltr
                                                            : TextDirection.rtl,
                                                    children: [
                                                      GlobalText(
                                                        text:
                                                            searchDataController
                                                                .wishList[index]
                                                                .discount,
                                                        style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                            fontSize: 10.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: AppColors
                                                                .titleTextColor),
                                                        softWrap: true,
                                                      ),
                                                      horizontalGap(3.sp),
                                                      GlobalText(
                                                        text:
                                                            searchDataController
                                                                .wishList[index]
                                                                .price,
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: AppColors
                                                                .titleTextColor),
                                                        softWrap: true,
                                                      ),
                                                      horizontalGap(5.sp),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            );
          }
        }
      }),
    );
  }
}
