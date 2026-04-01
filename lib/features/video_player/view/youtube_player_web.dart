import 'package:flutter/material.dart';

// Web player removed — keep a harmless stub to avoid platform-specific imports.
class YoutubeWebPlayer extends StatelessWidget {
  final String url;
  const YoutubeWebPlayer({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('YouTube web player disabled. Using native player instead.'),
    );
  }
}
