import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebVideoPlayer extends StatefulWidget {
  final String url;
 const  WebVideoPlayer({required this.url});

  @override
  State<WebVideoPlayer> createState() => _WebVideoPlayerState();
}

class _WebVideoPlayerState extends State<WebVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(widget.url)),
    );
  }
}
