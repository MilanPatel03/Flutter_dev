import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class BBCHome extends StatefulWidget {
  const BBCHome({super.key});

  @override
  State<BBCHome> createState() => _BBCHomeState();
}

class _BBCHomeState extends State<BBCHome> {

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse('https://www.bbc.com'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
