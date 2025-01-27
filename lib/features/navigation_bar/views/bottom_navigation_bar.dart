import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/learining/view/learing_view.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import 'package:skill_grow/features/navigation_bar/controller/bottom_nav_bar_controller.dart';
import 'package:skill_grow/features/profile/view/profile_view.dart';
import 'package:skill_grow/features/search/view/search_view.dart';
import '../../../core/colors/app_colors.dart'; // Add your own colors
import '../../../core/icons/app_icon.dart';
import '../../home/view/home_screen.dart'; // Add your own icon assets
// Your custom screens

class CustomPersistentBottomNavBar extends StatelessWidget {
  CustomPersistentBottomNavBar({super.key});

  // Create the BottomNavController
  final BottomNavController _controller = Get.put(BottomNavController());

  // Screens to navigate to
  final List<Widget> _screens = [
    HomeScreen(),
    SearchView(),
    LearingView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    return Obx(() {
      return Directionality(
        textDirection: multiLangualDataController.isLTR.value
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: Scaffold(
          body: _screens[
              _controller.currentIndex.value], // Display current screen
          bottomNavigationBar: Container(
            height: 70.h, // Set the height of the nav bar
            decoration: BoxDecoration(
              color: AppColors.scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10.r,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, AppIcon.lockIcon, "Home"),
                _buildNavItem(1, AppIcon.announcements, "Search"),
                _buildNavItem(2, AppIcon.playIcon, "Learning"),
                _buildNavItem(3, AppIcon.userIcon, "Profile"),
              ],
            ),
          ),
        ),
      );
    });
  }

  // Reusable method for navigation items
  Widget _buildNavItem(int index, String iconPath, String label) {
    final bool isSelected = _controller.currentIndex.value == index;
    final Color iconColor =
        isSelected ? AppColors.activeIconColor : AppColors.inactiveIconColor;
    final double iconSize = 20.sp; // Adjust icon size

    return GestureDetector(
      onTap: () => _controller.updateIndex(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: iconSize,
            height: iconSize,
            color: iconColor, // Change color based on selection
          ),
          SizedBox(height: 4.h),
          GlobalText(
            softWrap: false,
            text: label,
            style: TextStyle(
              color: iconColor,
              fontSize: 10.sp, // Adjust label size
            ),
          ),
        ],
      ),
    );
  }
}
