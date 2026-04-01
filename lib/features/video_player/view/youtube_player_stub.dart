import 'package:flutter/material.dart';

class YoutubeWebPlayer extends StatelessWidget {
  final String url;
  const YoutubeWebPlayer({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('YouTube web player not supported on this platform'));
  }
}
