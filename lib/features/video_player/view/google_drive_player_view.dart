import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class DriveVideoPlayer extends StatefulWidget {
  final String url;

  const DriveVideoPlayer({super.key, required this.url});

  @override
  State<DriveVideoPlayer> createState() => _DriveVideoPlayerState();
}

class _DriveVideoPlayerState extends State<DriveVideoPlayer> {
  late FlickManager _flickManager;
  bool isMuted = false;

  @override
  void initState() {
    super.initState();

    // Extract File ID from Google Drive URL
    String? fileId = extractGoogleDriveFileId(widget.url);
    if (fileId == null) {
      debugPrint("Invalid Google Drive URL");
      return;
    }

    // Correct direct download link
    String directUrl = "https://drive.google.com/uc?export=download&id=$fileId";

    // Initialize FlickManager with the video URL
    _flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(directUrl),
      autoPlay: true, // Auto-play the video
      autoInitialize: true, // Automatically initialize the video
    );

    // Set looping
    // _flickManager.flickControlManager?.setLooping(true);

    // Set initial volume
    _flickManager.flickControlManager?.setVolume(isMuted ? 0.0 : 1.0);
  }

  @override
  void dispose() {
    _flickManager.dispose(); // Dispose FlickManager
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Video Player
            Container(
              height: 200.0, // Fixed height for the video player
              width: double.infinity, // Stretch width
              child: FlickVideoPlayer(
                flickManager: _flickManager,
                flickVideoWithControls: FlickVideoWithControls(
                  controls: FlickPortraitControls(), // Use portrait controls
                ),
              ),
            ),

            // Mute Button
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: IconButton(
            //     onPressed: () {
            //       setState(() {
            //         isMuted = !isMuted;
            //         _flickManager.flickControlManager?.setVolume(isMuted ? 0.0 : 1.0);
            //       });
            //     },
            //     icon: Icon(
            //       isMuted ? Icons.volume_off : Icons.volume_up,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // Function to extract File ID from Google Drive URL
  String? extractGoogleDriveFileId(String url) {
    RegExp regExp = RegExp(r"/d/([a-zA-Z0-9_-]+)");
    var match = regExp.firstMatch(url);
    return match != null ? match.group(1) : null;
  }
}