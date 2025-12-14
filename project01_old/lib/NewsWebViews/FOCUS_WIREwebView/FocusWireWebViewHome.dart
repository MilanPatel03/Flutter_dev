import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class focusWireHome extends StatefulWidget {
  const focusWireHome({super.key});

  @override
  State<focusWireHome> createState() => _focusWireHomeState();
}

class _focusWireHomeState extends State<focusWireHome> {

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse('https://www.phocuswire.com/'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
