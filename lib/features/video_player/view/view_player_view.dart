import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/features/profile/controller/profile_data_cotroller.dart';
import '../controller/global_player_controller.dart';

class VideoScreen extends StatelessWidget {
  final String videoSource;
  final String videoUrl;

  const VideoScreen(
      {super.key, required this.videoSource, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    final ProfileDataCotroller profileDataController =
        Get.isRegistered<ProfileDataCotroller>()
            ? Get.find<ProfileDataCotroller>()
            : Get.put(ProfileDataCotroller());

    return SizedBox(
      height: 200.sp,
      child: Stack(
        children: [
          universalVideoPlayer(source: videoSource, url: videoUrl),
          Positioned(
            right: 10.sp,
            top: 10.sp,
            child: Obx(() {
              final userData =
                  profileDataController.userDataResponse.value?.data;
              final username = userData?.name ?? '';
              final userId = userData?.id.toString() ?? '';

              if (username.isEmpty && userId.isEmpty) {
                return const SizedBox.shrink();
              }
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
                // decoration: BoxDecoration(
                //   color: Colors.black54,
                //   borderRadius: BorderRadius.circular(8.sp),
                // ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (username.isNotEmpty)
                      Text(
                        username,
                        style: TextStyle(
                          fontFamily: 'BalooBhaijaan2',
                          fontSize: 6.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    if (userId.isNotEmpty)
                      Text(
                        userId,
                        style: TextStyle(
                          fontFamily: 'BalooBhaijaan2',
                          fontSize: 4.sp,
                          color: Colors.white70,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class FullScreenVideoScreen extends StatefulWidget {
  final String videoSource;
  final String videoUrl;

  const FullScreenVideoScreen(
      {super.key, required this.videoSource, required this.videoUrl});

  @override
  State<FullScreenVideoScreen> createState() => _FullScreenVideoScreenState();
}

class _FullScreenVideoScreenState extends State<FullScreenVideoScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ProfileDataCotroller profileDataController =
        Get.isRegistered<ProfileDataCotroller>()
            ? Get.find<ProfileDataCotroller>()
            : Get.put(ProfileDataCotroller());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Stack(
                children: [
                  universalVideoPlayer(
                    source: widget.videoSource,
                    url: widget.videoUrl,
                  ),
                  Positioned(
                    left: 16.sp,
                    top: 16.sp,
                    child: Obx(() {
                      final userData =
                          profileDataController.userDataResponse.value?.data;
                      final username = userData?.name ?? '';
                      final userId = userData?.id.toString() ?? '';

                      if (username.isEmpty && userId.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.sp, vertical: 5.sp),
                        // decoration: BoxDecoration(
                        //   color: Colors.black54,
                        //   borderRadius: BorderRadius.circular(10.sp),
                        // ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (username.isNotEmpty)
                              Text(
                                username,
                                style: TextStyle(
                                  fontFamily: 'BalooBhaijaan2',
                                  fontSize: 6.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            if (userId.isNotEmpty)
                              Text(
                                userId,
                                style: TextStyle(
                                  fontFamily: 'BalooBhaijaan2',
                                  fontSize: 4.sp,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
