import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../view/mp4_video_player_view.dart';
import '../view/vimo_and_drive_video_player_view.dart';
import '../view/youtube_video_player_view.dart';

// 🎬 VideoController using GetX
class VideoController extends GetxController {
  VideoPlayerController? mp4Controller;
  YoutubePlayerController? youtubeController;
  var isMp4Initialized = false.obs;
  var isYouTubeInitialized = false.obs;

  /// 🎥 Initialize MP4 Video Player
  void initializeMp4(String url) {
    if (mp4Controller == null || mp4Controller!.dataSource != url) {
      mp4Controller?.dispose(); // Dispose previous controller
      mp4Controller = VideoPlayerController.network(url)
        ..initialize().then((_) {
          isMp4Initialized.value = true;
          mp4Controller!.play();
          update(); // Refresh UI
        }).catchError((error) {
          print("Error initializing MP4 video: $error");
        });
    }
  }

  

  /// 🎬 Initialize YouTube Video Player
  void initializeYouTube(String url) {
    final videoId = YoutubePlayer.convertUrlToId(url);
    if (videoId != null) {
      youtubeController?.dispose(); // Dispose previous controller
      youtubeController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(autoPlay: true, mute: false),
      );
      isYouTubeInitialized.value = true;
      update(); // Refresh UI
    } else {
      print("Invalid YouTube URL: $url");
    }
  }

    /// 🎬 Enter Fullscreen Mode


  @override
  void onClose() {
    mp4Controller?.dispose();
    youtubeController?.dispose();
    super.onClose();
  }
}

/// 🎥 Universal Video Player Function
Widget universalVideoPlayer({required String source, required String url}) {
  switch (source.toLowerCase()) {
    case "youtube":
      return YouTubeVideoPlayer(url: url);
    case "vimeo":
    case "google_drive":
      return WebVideoPlayer(url: url); // Handles both Vimeo & Google Drive
    case "mp4":
      return MP4VideoPlayer(url: url);
    default:
      return Center(child: Text("❌ Unsupported video format"));
  }
}
