import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_grow/features/video_player/view/google_drive_player_view.dart';
import 'package:skill_grow/features/video_player/view/mp4_video_player_view.dart';
import 'package:skill_grow/features/video_player/view/vimo_and_drive_video_player_view.dart';
import 'package:skill_grow/features/video_player/view/youtube_player_view.dart';
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
  final lowerUrl = url.toLowerCase().trim();
  final lowerSource = source.toLowerCase().trim();

  // YouTube URLs have priority
  if (lowerUrl.contains('youtube.com') || lowerUrl.contains('youtu.be')) {
    return YoutubePlayerView(url: url);
  }

  // Vimeo URL or source
  if (lowerSource == 'vimeo' || lowerUrl.contains('vimeo.com')) {
    return WebVideoPlayer(url: url);
  }

  // Google Drive source
  if (lowerSource.contains('google_drive') ||
      lowerSource.contains('drive') ||
      lowerUrl.contains('drive.google.com')) {
    return DriveVideoPlayer(url: url);
  }

  // MP4/local uploaded video
  if (lowerSource == 'mp4' ||
      lowerSource == 'upload' ||
      lowerSource == 'video' ||
      lowerUrl.endsWith('.mp4') ||
      lowerUrl.endsWith('.mov') ||
      lowerUrl.endsWith('.webm')) {
    return MP4VideoPlayer(url: url);
  }

  // Fallback: try mp4 if extension suggests it
  if (lowerUrl.contains('.mp4') ||
      lowerUrl.contains('.mov') ||
      lowerUrl.contains('.webm')) {
    return MP4VideoPlayer(url: url);
  }

  return Center(
    child: Text(
      "❌ Unsupported video format (source: $source, url: $url)",
      textAlign: TextAlign.center,
    ),
  );
}
