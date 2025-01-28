import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controller/global_player_controller.dart';

class VideoScreen extends StatelessWidget {
  final String videoSource;
  final String videoUrl;

  const VideoScreen(
      {super.key, required this.videoSource, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Player")),
      body: SafeArea(
        child: SizedBox(
            height: 200.sp,
            child: universalVideoPlayer(source: videoSource, url: videoUrl)),
      ),
    );
  }
}
