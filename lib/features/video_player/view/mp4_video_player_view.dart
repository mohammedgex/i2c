import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

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
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlickVideoPlayer(
          flickManager: flickManager,
          flickVideoWithControls: FlickVideoWithControls(
            controls: FlickLandscapeControls(),
          ),
        ),
      ),
    );
  }
}
