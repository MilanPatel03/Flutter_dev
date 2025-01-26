import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CNNHome extends StatefulWidget {
  const CNNHome({super.key});

  @override
  State<CNNHome> createState() => _CNNHomeState();
}

class _CNNHomeState extends State<CNNHome> {

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse('https://edition.cnn.com/'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
