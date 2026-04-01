import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubePlayerView extends StatefulWidget {
  final String url;
  const YoutubePlayerView({super.key, required this.url});

  @override
  State<YoutubePlayerView> createState() => _YoutubePlayerViewState();
}

class _YoutubePlayerViewState extends State<YoutubePlayerView> {
  late YoutubePlayerController _controller;
  bool _isValid = true;
  bool _attemptedPlay = false;
  String? _videoId;
  bool _embedBlocked = false;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.url);
    if (videoId == null) {
      _isValid = false;
      return;
    }

    _videoId = videoId;

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
      ),
    );

    // Listen for readiness and errors; try to play once ready
    _controller.addListener(_controllerListener);
  }

  void _controllerListener() {
    try {
      final state = _controller.value;
      if (!_attemptedPlay && state.isReady) {
        _attemptedPlay = true;
        _controller.play();
      }
      if (state.hasError) {
        // Log error code for debugging
        debugPrint('YouTube player error: ${state.errorCode}');
        // Some YouTube error codes indicate embedding is blocked (e.g. 101, 150, 153)
        final code = state.errorCode;
        if (code == 101 || code == 150 || code == 153) {
          _embedBlocked = true;
          // stop trying to play
          _controller.pause();
          setState(() {});
        }
      }
    } catch (e) {
      debugPrint('YouTube controller listener error: $e');
    }
  }

  @override
  void dispose() {
    if (_isValid) {
      _controller.removeListener(_controllerListener);
      _controller.pause();
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isValid) {
      return Center(child: Text('رابط YouTube غير صالح'));
    }

    if (_embedBlocked) {
      final videoUrl = _videoId != null
          ? 'https://www.youtube.com/watch?v=${_videoId!}'
          : widget.url;
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('معذرة، تشغيل الفيديو داخل التطبيق ممنوع لهذا المحتوى.'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                final uri = Uri.parse(videoUrl);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {
                  // fallback: attempt regular launch
                  await launchUrl(uri);
                }
              },
              child: const Text('افتح في تطبيق اليوتيوب / المتصفح'),
            ),
          ],
        ),
      );
    }

    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: _controller),
      builder: (context, player) {
        final screenSize = MediaQuery.of(context).size;
        return Container(
          width: screenSize.width * 0.9,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Column(
              children: [
                // The player
                Expanded(child: player),
                // Optionally any additional controls or info can go here
              ],
            ),
          ),
        );
      },
    );
  }
}
