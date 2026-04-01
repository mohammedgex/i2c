import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/constant/constant.dart';
import 'package:skill_grow/features/cart/view/cart_view.dart';
import 'package:skill_grow/features/course/view/wish_list_view.dart';

import '../../features/cart/controller/cart_list_controller.dart';
import '../../features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import '../colors/app_colors.dart';
import '../icons/app_icon.dart';
import '../images/app_image.dart';

class MyCustomAppBar extends StatelessWidget {
  final double? horizontalPadding;
  final double? verticalPadding;
  final bool isShowbackButton;
  final bool? isShowNotification;
  final bool isShowMenu;

  MyCustomAppBar(
      {super.key,
      this.horizontalPadding,
      this.verticalPadding,
      this.isShowbackButton = false,
      this.isShowNotification = true,
      this.isShowMenu = false});
  MultiLangualDataController multiLangualDataController =
      Get.put(MultiLangualDataController());

  CartListController cartListController = Get.put(CartListController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 15.sp,
          vertical: (verticalPadding ?? 0.sp) + 8.sp),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.scaffoldBackgroundColor,
            AppColors.scaffoldBackgroundColor.withOpacity(0.95),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColorLight,
            blurRadius: 8.sp,
            offset: Offset(0, 2.sp),
          ),
        ],
      ),
      child: Row(
        textDirection: multiLangualDataController.isLTR.value
            ? TextDirection.ltr
            : TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isShowMenu)
            Builder(
              builder: (context) => Bounceable(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Container(
                  height: 48.sp,
                  width: 48.sp,
                  decoration: BoxDecoration(
                      // color: AppColors.cardBackgroundColor,
                      // shape: BoxShape.circle,
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: AppColors.shadowColorLight,
                      //     blurRadius: 8.sp,
                      //     offset: Offset(0, 2.sp),
                      //   ),
                      // ],
                      ),
                  child: Center(
                    child: Icon(
                      Icons.menu,
                      size: 30,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          if (isShowMenu) horizontalGap(10.sp),
          if (isShowbackButton)
            Bounceable(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 44.sp,
                width: 44.sp,
                decoration: BoxDecoration(
                  color: AppColors.cardBackgroundColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColorLight,
                      blurRadius: 8.sp,
                      offset: Offset(0, 2.sp),
                    ),
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppIcon.arrowBackIcon,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          if (isShowbackButton) horizontalGap(10.sp),
          if (isShowNotification == false) horizontalGap(100.sp),
          Image.asset(
            AppImage.logo,
            width: 110.sp,
            height: 40.98.sp,
          ),
          Spacer(),
          if (isShowNotification == true)
            Bounceable(
              onTap: () {
                Get.to(() => WishListView());
              },
              child: Container(
                height: 44.sp,
                width: 44.sp,
                decoration: BoxDecoration(
                  color: AppColors.cardBackgroundColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColorLight,
                      blurRadius: 8.sp,
                      offset: Offset(0, 2.sp),
                    ),
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppIcon.addwishIcon,
                    color: AppColors.primaryColor,
                    width: 20.sp,
                    height: 20.sp,
                  ),
                ),
              ),
            ),
          if (isShowNotification == true) horizontalGap(10.sp),
          if (isShowNotification == true)
            Bounceable(
              onTap: () {
                Get.to(() => CartView());
              },
              child: Container(
                height: 44.sp,
                width: 44.sp,
                decoration: BoxDecoration(
                  color: AppColors.cardBackgroundColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColorLight,
                      blurRadius: 8.sp,
                      offset: Offset(0, 2.sp),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        AppIcon.cartIcon,
                        width: 20.sp,
                        color: AppColors.primaryColor,
                        height: 20.sp,
                      ),
                    ),
                    Positioned(
                      top: 6.sp,
                      right: 6.sp,
                      child: Container(
                        height: 16.sp,
                        width: 16.sp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              AppColors.mainRedColor,
                              AppColors.secondRedColor,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.mainRedColor.withOpacity(0.5),
                              blurRadius: 4.sp,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Obx(() {
                            if (cartListController.isLoading.value) {
                              return SizedBox();
                            } else {
                              if (cartListController
                                  .cartData.value.cartCourses.isEmpty) {
                                return FittedBox(
                                  child: Text(
                                    "0",
                                    style: TextStyle(
                                      color: AppColors.cardBackgroundColor,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 9.sp,
                                    ),
                                  ),
                                );
                              } else {
                                return FittedBox(
                                  child: Text(
                                    cartListController
                                        .cartData.value.cartCourses.length
                                        .toString(),
                                    style: TextStyle(
                                      color: AppColors.cardBackgroundColor,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 9.sp,
                                    ),
                                  ),
                                );
                              }
                            }
                          }),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
