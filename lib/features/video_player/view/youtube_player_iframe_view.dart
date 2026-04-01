import 'package:flutter/material.dart';

// Stub implementation — iframe player removed. Keep file to avoid import errors.
class YoutubeIFrameView extends StatelessWidget {
  final String url;
  const YoutubeIFrameView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('YouTube iframe player disabled. Using native player.'),
    );
  }
}
