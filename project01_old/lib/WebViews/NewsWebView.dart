import 'package:flutter/material.dart';

class newsWebViewOfHome extends StatefulWidget {
  const newsWebViewOfHome({super.key});

  @override
  State<newsWebViewOfHome> createState() => _newsWebViewOfHomeState();
}

class _newsWebViewOfHomeState extends State<newsWebViewOfHome> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('title'),
        backgroundColor: Colors.blue.shade900,
      ),

    );
  }
}
