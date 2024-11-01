import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NBCHome extends StatefulWidget {
  const NBCHome({super.key});

  @override
  State<NBCHome> createState() => _NBCHomeState();
}

class _NBCHomeState extends State<NBCHome> {

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse('https://www.nbc.com/'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}

