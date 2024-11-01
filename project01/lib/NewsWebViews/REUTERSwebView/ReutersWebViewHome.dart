import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class reutersHome extends StatefulWidget {
  const reutersHome({super.key});

  @override
  State<reutersHome> createState() => _reutersHomeState();
}

class _reutersHomeState extends State<reutersHome> {

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse('https://www.reuters.com/'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
