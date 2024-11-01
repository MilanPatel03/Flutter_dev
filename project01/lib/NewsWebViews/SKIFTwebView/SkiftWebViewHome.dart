import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class skiftHome extends StatefulWidget {
  const skiftHome({super.key});

  @override
  State<skiftHome> createState() => _skiftHomeState();
}

class _skiftHomeState extends State<skiftHome> {

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://skift.com/'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
