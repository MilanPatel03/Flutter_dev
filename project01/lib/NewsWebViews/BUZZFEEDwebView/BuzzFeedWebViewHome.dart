import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class buzzFeedHome extends StatefulWidget {
  const buzzFeedHome({super.key});

  @override
  State<buzzFeedHome> createState() => _buzzFeedHomeState();
}

class _buzzFeedHomeState extends State<buzzFeedHome> {

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse('https://www.buzzfeed.com/in'));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
