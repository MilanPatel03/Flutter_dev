import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class theGuardianHome extends StatefulWidget {
  const theGuardianHome({super.key});

  @override
  State<theGuardianHome> createState() => _theGuardianHomeState();
}

class _theGuardianHomeState extends State<theGuardianHome> {

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse('https://www.theguardian.com/international'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
