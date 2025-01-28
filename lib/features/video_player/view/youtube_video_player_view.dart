import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controller/global_player_controller.dart';

class YouTubeWebViewPlayer extends StatelessWidget {
  final String url;
  YouTubeWebViewPlayer({required this.url});

  final VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    videoController.initializeYouTube(url);

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text("YouTube Player"),
          backgroundColor: Colors.black,
        ),
        body: WebViewWidget(
      controller: WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(url)),
    
        ),
      );
    });
  }
}
