import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/images/app_image.dart';
import 'package:skill_grow/features/authentication/view/login_view.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';

import 'core/Global/sharedPref.dart';
import 'features/navigation_bar/views/bottom_navigation_bar.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    return Scaffold(
      body: Obx(() {
        if (multiLangualDataController.isLoading.value == true) {
          return Center(
            child: Image.asset(
              AppImage.logo,
              height: 120.sp,
              width: 180.sp,
            ),
          );
        } else {
          return FutureBuilder<bool>(
            future: SharedPrefUtil.get('isLoggedin', false)
                .then((value) => value as bool), // Explicit cast
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Show a loading indicator
              }
              if (snapshot.hasData && snapshot.data == true) {
                return CustomPersistentBottomNavBar();
              } else {
                return LoginView();
              }
            },
          );
        }
      }),
    );
  }
}
