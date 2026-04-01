import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:skill_grow/features/profile/controller/profile_data_cotroller.dart';

class MP4VideoPlayer extends StatefulWidget {
  final String url;

  const MP4VideoPlayer({super.key, required this.url});

  @override
  _MP4VideoPlayerState createState() => _MP4VideoPlayerState();
}

class _MP4VideoPlayerState extends State<MP4VideoPlayer> {
  late FlickManager flickManager;
  bool isPlaying = false;
  double playbackSpeed = 1.0;
  bool isFullscreen = false;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.url),
      autoPlay: false,
      autoInitialize: true,
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ProfileDataCotroller profileDataController =
        Get.isRegistered<ProfileDataCotroller>()
            ? Get.find<ProfileDataCotroller>()
            : Get.put(ProfileDataCotroller());

    final videoController =
        flickManager.flickVideoManager?.videoPlayerController;
    final double aspectRatio =
        (videoController != null && videoController.value.isInitialized)
            ? videoController.value.aspectRatio
            : 9 / 16;

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            FlickVideoPlayer(
              flickManager: flickManager,
              flickVideoWithControls: FlickVideoWithControls(
                controls: FlickPortraitControls(),
                videoFit: BoxFit.contain,
                aspectRatioWhenLoading: aspectRatio,
              ),
              flickVideoWithControlsFullscreen: FlickVideoWithControls(
                controls: FlickLandscapeControls(),
                videoFit: BoxFit.contain,
                aspectRatioWhenLoading: aspectRatio,
              ),
            ),
            Positioned(
              left: 10.sp,
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.sp, vertical: 6.sp),
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
      ),
    );
  }
}
