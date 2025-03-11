
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';

import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import 'package:skill_grow/features/profile/controller/log_out_controller.dart';

  void showLogoutDialog(BuildContext context, bool isAllDeviceLogout) {
    LogOutController logOutController = Get.put(LogOutController());
    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: multiLangualDataController.isLTR.value
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: AlertDialog(
          title: GlobalText(text: "Confirm Logout"),
          content: GlobalText(text: "Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: GlobalText(
                text: ("Cancel"),
              ),
            ),
            TextButton(
              onPressed: () {
                if (isAllDeviceLogout) {
                  logOutController.logoutFromAllDevices();
                  // logout from all device
                } else {
                  logOutController.logOutFromThisDevice();
                  // logout from this device
                }
              },
              child: GlobalText(
                text: "Logout",
                style: TextStyle(
                  color: AppColors.mainRedColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }