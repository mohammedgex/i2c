import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_grow/core/icons/app_icon.dart';
import '../../../core/colors/app_colors.dart';
import 'controller/custom_slider_conroller.dart';

class CustomSlidable extends StatelessWidget {
  final Widget child;
  final VoidCallback onDelete;
  final RxBool isLoading;

  const CustomSlidable({
    super.key,
    required this.child,
    required this.onDelete,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final SlidableController slidableController =
        SlidableController(); // Create a new instance for each item

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        slidableController.updateDragExtent(details.primaryDelta!);
      },
      onHorizontalDragEnd: (details) {
        slidableController.handleDragEnd();
      },
      child: Stack(
        children: [
          // Background Delete Button
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: Bounceable(
                onTap: onDelete,
                child: Container(
                  width: slidableController.maxSlide,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.secondRedColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Obx(() {
                      if (isLoading.value) {
                        return SizedBox(
                          height: 25.sp,
                          width: 25.sp,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }
                      return SizedBox(
                        height: 25.sp,
                        width: 25.sp,
                        child: SvgPicture.asset(AppIcon.binIcon),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),

          // Foreground Sliding Item
          Obx(() => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: Matrix4.translationValues(
                    -slidableController.dragExtent.value, 0, 0),
                child: child,
              )),
        ],
      ),
    );
  }
}
