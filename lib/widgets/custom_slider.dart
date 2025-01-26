import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_grow/core/icons/app_icon.dart';
import '../../../core/colors/app_colors.dart';
import 'controller/custom_slider_conroller.dart';

class CustomSlidable extends StatelessWidget {
  final Widget child;
  final VoidCallback onDelete;

  CustomSlidable({
    super.key,
    required this.child,
    required this.onDelete,
  });

  final SlidableController slidableController = Get.put(SlidableController());

  @override
  Widget build(BuildContext context) {
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
              child: GestureDetector(
                onTap: () {
                  onDelete();
                  slidableController.close();
                },
                child: Container(
                  width: slidableController.maxSlide,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.secondRedColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: SizedBox(
                        height: 25.sp,
                        width: 25.sp,
                        child: SvgPicture.asset(AppIcon.binIcon)),
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
