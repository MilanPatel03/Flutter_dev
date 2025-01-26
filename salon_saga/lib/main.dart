import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_saga/controllers/serviceController.dart';
import 'package:salon_saga/views/screens/homeScreens/homePage.dart';



void main() {
  Get.put(ServiceController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainHomePage(),
    );
  }
}

