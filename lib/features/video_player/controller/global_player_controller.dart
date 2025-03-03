import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_grow/features/video_player/view/google_drive_player_view.dart';
import 'package:skill_grow/features/video_player/view/mp4_video_player_view.dart';
import 'package:skill_grow/features/video_player/view/vimo_and_drive_video_player_view.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class VideoController extends GetxController {
  VideoPlayerController? mp4Controller;
  YoutubePlayerController? youtubeController;
  var isMp4Initialized = false.obs;
  var isYouTubeInitialized = false.obs;

  /// 🎥 Initialize MP4 Video Player
  void initializeMp4(String url) {
    if (mp4Controller == null || mp4Controller!.dataSource != url) {
      mp4Controller?.dispose();
      mp4Controller = VideoPlayerController.network(url)
        ..initialize().then((_) {
          isMp4Initialized.value = true;
          mp4Controller!.play();
        }).catchError((error) {
          print("Error initializing MP4 video: $error");
        });
    }
  }

  /// 🎬 Initialize YouTube Video Player (Fixed `convertUrlToId`)
  void initializeYouTube(String url) {
    final videoId = YoutubePlayer.convertUrlToId(url); // ✅ Correct method usage
    if (videoId != null) {
      if (youtubeController == null) {
        youtubeController = YoutubePlayerController(
          initialVideoId: videoId,
          flags: YoutubePlayerFlags(
            autoPlay: true,
            // showControls: true,
            // showFullscreenButton: true,
          ),
        );
      } else {
        youtubeController!.load(videoId);
      }
      isYouTubeInitialized.value = true;
    } else {
      print("Invalid YouTube URL: $url");
    }
  }

  /// 🎬 Clean up resources when the controller is disposed
  @override
  void onClose() {
    mp4Controller?.dispose();
    youtubeController?.pause(); // Avoid dispose() to prevent reuse issues
    super.onClose();
  }
}

/// 🎥 Universal Video Player Function
Widget universalVideoPlayer({required String source, required String url}) {
  switch (source.toLowerCase()) {
    case "youtube":
    case "vimeo":
      return WebVideoPlayer(url: url); // Handles both Vimeo & Google Drive
    case "google_drive":
      return DriveVideoPlayer(url: url); // Handles both Vimeo & Google Drive
    case "mp4":
      return MP4VideoPlayer(url: url);
    default:
      return Center(child: Text("❌ Unsupported video format"));
  }
}
