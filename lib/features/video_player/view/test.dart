import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_grow/features/video_player/view/view_player_view.dart';

class VideoSelectionScreen extends StatelessWidget {
  const VideoSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Video to Play")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            VideoButton(
              label: "Play YouTube Video",
              color: Colors.red,
              onPressed: () {
                Get.to(() => VideoScreen(
                      videoSource: "youtube",
                      videoUrl: "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
                    ));
              },
            ),
            VideoButton(
              label: "Play Vimeo Video",
              color: Colors.blue,
              onPressed: () {
                Get.to(() => VideoScreen(
                      videoSource: "vimeo",
                      videoUrl: "https://player.vimeo.com/video/273651219",
                    ));
              },
            ),
            VideoButton(
              label: "Play Google Drive Video",
              color: Colors.green,
              onPressed: () {
                Get.to(() => VideoScreen(
                      videoSource: "google_drive",
                      videoUrl:
                          "https://drive.google.com/file/d/1CmtT6i3-QZtz7Oq_lcJHBcQkCVMdb0cV/preview",
                    ));
              },
            ),
            VideoButton(
              label: "Play MP4 Video",
              color: Colors.orange,
              onPressed: () {
                Get.to(() => VideoScreen(
                      videoSource: "mp4",
                      videoUrl:
                          "https://videos.pexels.com/video-files/9806389/9806389-uhd_2560_1440_25fps.mp4",
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Video Button Widget
class VideoButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const VideoButton(
      {super.key,
      required this.label,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 16.0),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
