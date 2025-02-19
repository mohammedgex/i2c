// ignore_for_file: unused_local_variable

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/core/widgets/appbar.dart';
import 'package:skill_grow/core/widgets/custom_rating_bar.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/cart/controller/add_to_cart_controller.dart';
import 'package:skill_grow/features/course/controller/course_details_controller.dart';
import 'package:skill_grow/features/course/controller/toggle_wish_controller.dart';
import 'package:skill_grow/features/course/widget/course_info.dart';
import 'package:skill_grow/features/course/widget/loading_ui.dart';
import 'package:skill_grow/features/course/widget/toggle_widget.dart';
import '../../mulit_langual_data/controller/multi_langual_data_controller.dart';
import '../../profile/controller/profile_data_cotroller.dart';
import '../../video/view/widget/initial_tumbnail_ui.dart';
import '../../video_player/view/view_player_view.dart';
import '../controller/wish_list_controller.dart';

class CourseDetailsView extends StatelessWidget {
  final String slug;
  const CourseDetailsView({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    AddToCartController addToCartController = Get.put(AddToCartController());
    ProfileDataCotroller profileDataCotroller = Get.put(ProfileDataCotroller());
    CourseDetalisController courseDetalisController = Get.put(
        CourseDetalisController(slug,
            profileDataCotroller.userDataResponse.value!.data.id.toString()));
    WishListController wishListController = Get.put(WishListController());
    ToggleWishController toggleWishController = Get.put(ToggleWishController());
    RxBool isShowVideo = false.obs;

    return Scaffold(
      body: ColorfulSafeArea(
        bottom: false,
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Obx(() {
            if (courseDetalisController.isLoading.value) {
              return CourserDetailsLoading();
            } else if (courseDetalisController.course.value == null) {
              return Center(
                child: GlobalText(
                  text: "Course details not available",
                  softWrap: true,
                ),
              );
            } else {
              if (courseDetalisController.course.value!.isWishlist == true) {
                toggleWishController.isWishActive.value = true;
              }
              return SingleChildScrollView(
                child: Column(
                  textDirection: multiLangualDataController.isLTR.value
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyCustomAppBar(
                      horizontalPadding: 0,
                      verticalPadding: 0,
                      isShowbackButton: true,
                    ),
                    verticalGap(10.sp),
                    Container(
                        width: double.infinity,
                        height: 200.sp,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: Obx(() {
                          if (isShowVideo.value) {
                            return VideoScreen(
                                videoSource: courseDetalisController
                                    .course.value!.videoSource,
                                videoUrl: courseDetalisController
                                    .course.value!.demoVideo);
                          } else {
                            return InitialTumbnailUI(
                              isShowWishIcon: true,
                              thumbnailImage: courseDetalisController
                                  .course.value!.thumbnail,
                              wishOntap: () {
                                toggleWishController.sendStatus(slug: slug);
                              },
                              playOntap: () {
                                isShowVideo.value = true;
                              },
                            );
                          }
                        })),
                    verticalGap(10.sp),
                    GlobalText(
                      text: courseDetalisController.course.value?.title ??
                          "No Title",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w700),
                    ),
                    verticalGap(5.sp),
                    RichText(
                      text: TextSpan(
                        text: translatedText("Created by"),
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.smallTextColor,
                        ),
                        children: [
                          TextSpan(
                            text: " ",
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: translatedText(courseDetalisController
                                    .course.value?.instructor.name ??
                                "Unknown"),
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalGap(7.sp),
                    Row(
                      textDirection: multiLangualDataController.isLTR.value
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      children: [
                        CustomRatingBar(
                          rating: courseDetalisController
                                  .course.value?.averageRating ??
                              0,
                          maxRating: 5,
                          iconSize: 15.sp,
                          filledColor: AppColors.primaryColor,
                          unfilledColor: AppColors.activeIconColor,
                        ),
                        horizontalGap(3.sp),
                        GlobalText(
                          text:
                              "(${courseDetalisController.course.value?.reviewsCount ?? 0})",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.smallTextColor,
                          ),
                          softWrap: true,
                        ),
                        GlobalText(
                          text: " | ",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.smallTextColor,
                          ),
                          softWrap: true,
                        ),
                        GlobalText(
                          text:
                              "${courseDetalisController.course.value?.students ?? 0}",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.smallTextColor,
                          ),
                          softWrap: true,
                        ),
                        GlobalText(
                          text: " Students",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.smallTextColor,
                          ),
                          softWrap: true,
                        ),
                      ],
                    ),
                    verticalGap(15.sp),
                    CourseInfo(
                        courseDetalisController: courseDetalisController),
                    verticalGap(15.sp),
                    Row(
                      textDirection: multiLangualDataController.isLTR.value
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      children: [
                        Expanded(
                          child: Container(
                            height: 80.sp,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.sp),
                            ),
                            child: Column(
                              textDirection:
                                  multiLangualDataController.isLTR.value
                                      ? TextDirection.ltr
                                      : TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: translatedText("Price"),
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.smallTextColor,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ":",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Wrap(
                                  textDirection:
                                      multiLangualDataController.isLTR.value
                                          ? TextDirection.ltr
                                          : TextDirection.rtl,
                                  crossAxisAlignment: WrapCrossAlignment.end,
                                  children: [
                                    FittedBox(
                                      child: GlobalText(
                                        text: courseDetalisController
                                                .course.value?.price ??
                                            "N/A",
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                    horizontalGap(5.sp),
                                    FittedBox(
                                      child: GlobalText(
                                        text: courseDetalisController
                                                .course.value?.discount ??
                                            "N/A",
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        horizontalGap(10.sp),
                        Expanded(
                          child: Obx(() {
                            if (addToCartController.isLoading.value) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Bounceable(
                                onTap: () {
                                  addToCartController.addToCart(slug);
                                },
                                child: Container(
                                  height: 40.sp,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    border: Border.all(
                                        color: AppColors.primaryColor,
                                        width: 1.5.sp),
                                    borderRadius: BorderRadius.circular(5.sp),
                                  ),
                                  child: Center(
                                    child: GlobalText(
                                      text: "Add to Cart",
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          }),
                        ),
                        horizontalGap(10.sp),
                      ],
                    ),
                    ToggleWidget(
                      courseDetalisController: courseDetalisController,
                    ),
                  ],
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
