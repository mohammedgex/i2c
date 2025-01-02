import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/icons/app_icon.dart';
import 'package:skill_grow/features/home/view/home_screen.dart';
import '../../../core/colors/app_colors.dart';
import '../controller/bottom_nav_bar_controller.dart';

class PersistentBottomNavBar extends StatelessWidget {
  PersistentBottomNavBar({super.key});

  final BottomNavController _controller = Get.put(BottomNavController());

  final List<Widget> _screens = [
    HomeScreen(),
    Center(child: Text('Search', style: TextStyle(fontSize: 20))),
    Center(child: Text('Learning', style: TextStyle(fontSize: 20))),
    Center(child: Text('Profile', style: TextStyle(fontSize: 20))),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: _controller.currentIndex.value,
          children: _screens,
        ),
        bottomNavigationBar: Container(
          height: 55.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home_outlined),
                onPressed: () => _controller.updateIndex(0),
              ),
              // IconButton(
              //   icon: SvgPicture.asset(
              //     AppIcon.searchIcon,
              //     color: _controller.currentIndex.value == 1
              //         ? AppColors.inactiveIconColor
              //         : AppColors.primaryColor,
              //   ),
              //   onPressed: () => _controller.updateIndex(1),
              // ),
              // IconButton(
              //   icon: SvgPicture.asset(
              //     AppIcon.playIcon,
              //     color: _controller.currentIndex.value == 2
              //         ? AppColors.inactiveIconColor
              //         : AppColors.primaryColor,
              //   ),
              //   onPressed: () => _controller.updateIndex(2),
              // ),
              // IconButton(
              //   icon: SvgPicture.asset(
              //     AppIcon.userIcon,
              //     color: _controller.currentIndex.value == 3
              //         ? AppColors.inactiveIconColor
              //         : AppColors.primaryColor,
              //   ),
              //   onPressed: () => _controller.updateIndex(3),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
