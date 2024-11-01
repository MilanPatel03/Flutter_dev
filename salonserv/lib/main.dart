import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:salonserv/firstsplash/splashscreen01.dart';
import 'home/homepage.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (BuildContext context)=> const MyApp(),),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen01(),
    );
  }
}

