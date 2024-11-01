import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class theIndependentHome extends StatefulWidget {
  const theIndependentHome({super.key});

  @override
  State<theIndependentHome> createState() => _theIndependentHomeState();
}

class _theIndependentHomeState extends State<theIndependentHome> {

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse('https://www.independent.co.uk/news/world'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
