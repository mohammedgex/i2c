import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebVideoPlayer extends StatelessWidget {
  final String url;
  WebVideoPlayer({required this.url});

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(url)),
    );
  }
}
