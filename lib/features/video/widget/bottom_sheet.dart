import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:skill_grow/core/widgets/button.dart';
import 'package:skill_grow/core/widgets/texts.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import 'package:skill_grow/features/video/controller/download_file_controller.dart';
import 'package:skill_grow/features/video/controller/lesson_resource_file_download_controller.dart';
import '../../../core/constant/constant.dart';

class ResourceDownloadBottomSheet extends StatelessWidget {
  const ResourceDownloadBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    LessonResourceFileDownloadController lessonResourceFileDownloadController =
        Get.put(LessonResourceFileDownloadController());
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    DownloadController downloadController = Get.put(DownloadController());

    // Define reusable TextStyles
    final TextStyle titleStyle = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

    final TextStyle subtitleStyle = TextStyle(
      fontSize: 14.sp,
      color: Colors.black87,
    );

    final TextStyle progressStyle = TextStyle(
      fontSize: 16.sp,
      color: Colors.black,
    );

    final TextStyle errorStyle = TextStyle(
      fontSize: 14.sp,
      color: Colors.red,
    );

    final TextStyle successStyle = TextStyle(
      fontSize: 14.sp,
      color: Colors.green,
    );

    return Container(
      height: 300.sp, // Increased height to accommodate additional data
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
      width: double.infinity,
      color: Colors.white,
      child: Obx(
        () {
          if (lessonResourceFileDownloadController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Display file details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GlobalText(
                      text:
                          'File Name: ${lessonResourceFileDownloadController.lessonResource.value.title}',
                      style: titleStyle, // Applied titleStyle
                      softWrap: true,
                    ),
                    verticalGap(5.sp),
                    GlobalText(
                      text:
                          'File Type: ${lessonResourceFileDownloadController.lessonResource.value.fileType}',
                      style: subtitleStyle, // Applied subtitleStyle
                      softWrap: true,
                    ),
                    verticalGap(5.sp),
                    GlobalText(
                      text:
                          'Duration: ${lessonResourceFileDownloadController.lessonResource.value.duration}',
                      style: subtitleStyle, // Applied subtitleStyle
                      softWrap: true,
                    ),
                    verticalGap(5.sp),
                    GlobalText(
                      text:
                          'Description: ${lessonResourceFileDownloadController.lessonResource.value.description}',
                      style: subtitleStyle, // Applied subtitleStyle
                      softWrap: true,
                    ),
                    verticalGap(10.sp),
                  ],
                ),
                Obx(() {
                  if (downloadController.isDownloading.value) {
                    return Column(
                      children: [
                        CircularProgressIndicator(
                          value: downloadController.downloadProgress.value,
                        ),
                        verticalGap(10.sp),
                        GlobalText(
                          text:
                              '${(downloadController.downloadProgress.value * 100).toStringAsFixed(2)}%',
                          style: progressStyle, // Applied progressStyle
                          softWrap: true,
                        ),
                      ],
                    );
                  } else if (downloadController.isDownloadComplete.value) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      textDirection: multiLangualDataController.isLTR.value
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      children: [
                        GlobalText(
                          text: 'Download Complete!',
                          style: successStyle, // Applied successStyle
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                        verticalGap(10.sp),
                        GlobalButton(
                          color: AppColors.primaryColor,
                          height: 40.sp,
                          width: 250.sp,
                          onTap: downloadController.openDownloadedFile,
                          text: 'Open File',
                        ),
                      ],
                    );
                  } else if (downloadController.errorMessage.value.isNotEmpty) {
                    return GlobalText(
                      text: downloadController.errorMessage.value,
                      style: errorStyle, // Applied errorStyle
                      textAlign: TextAlign.center,
                      softWrap: true,
                    );
                  } else {
                    return GlobalText(
                      text: 'Press the button to start download',
                      style: subtitleStyle, // Applied subtitleStyle
                      softWrap: true,
                    );
                  }
                }),
                verticalGap(20.sp),
                // Conditionally render Download or Open File button
                Obx(() {
                  if (downloadController.isDownloadComplete.value) {
                    return const SizedBox.shrink(); // Hide the Download button
                  } else {
                    return GlobalButton(
                      color: AppColors.primaryColor,
                      height: 40.sp,
                      width: 250.sp,
                      onTap: () {
                        downloadController.downloadFile(
                          url: lessonResourceFileDownloadController
                              .lessonResource.value.filePath,
                          name: lessonResourceFileDownloadController
                              .lessonResource.value.title,
                        );
                      },
                      text: "Download",
                    );
                  }
                }),
              ],
            );
          }
        },
      ),
    );
  }
}
