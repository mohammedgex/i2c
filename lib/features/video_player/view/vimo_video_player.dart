import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:skill_grow/core/colors/app_colors.dart';
import 'package:video_player/video_player.dart';

class VimeoVideoPlayer extends StatefulWidget {
  final String url;

  const VimeoVideoPlayer({super.key, required this.url});

  @override
  State<VimeoVideoPlayer> createState() => _VimeoVideoPlayerState();
}

class _VimeoVideoPlayerState extends State<VimeoVideoPlayer> {
  late FlickManager _flickManager;
  bool isMuted = false;

  @override
  void initState() {
    super.initState();

    String? videoUrl = extractVimeoVideoUrl(widget.url);
    if (videoUrl == null) {
      debugPrint("Invalid Vimeo URL");
      return;
    }

    _flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(videoUrl),
      autoPlay: true,
      autoInitialize: true,
    );
  }

  @override
  void dispose() {
    // Only dispose _flickManager if it was initialized.
    _flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Ensure _flickManager is initialized before using it.
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200.0,
              width: double.infinity,
              child: FlickVideoPlayer(
                flickManager: _flickManager,
                flickVideoWithControls: FlickVideoWithControls(
                  iconThemeData: IconThemeData(
                    color: AppColors.primaryColor,
                  ),
                  controls: FlickPortraitControls(
                    progressBarSettings: FlickProgressBarSettings(
                      playedColor: AppColors.primaryColor,
                      handleColor: AppColors.primaryColor,
                      backgroundColor: Colors.grey,
                      bufferedColor: Colors.white70,
                    ),
                  ),
                  textStyle: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? extractVimeoVideoUrl(String url) {
    RegExp regExp = RegExp(r"vimeo.com/(\d+)");
    var match = regExp.firstMatch(url);
    return match != null
        ? "https://player.vimeo.com/video/${match.group(1)}/config"
        : null;
  }
}
