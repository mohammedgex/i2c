import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controller/global_player_controller.dart';

class YouTubeVideoPlayer extends StatelessWidget {
  final String url;
  YouTubeVideoPlayer({required this.url});

  final VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    videoController.initializeYouTube(url);

    return Obx(() {
      if (videoController.isYouTubeInitialized.value) {
        return YoutubePlayer(
          controller: videoController.youtubeController!,
          showVideoProgressIndicator: true,
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }
}
