import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:salonverse/Data/Services/SalonServices/ServiceController.dart';
import 'package:salonverse/UI/Auth/Screens/LoginSignupScreen.dart';
import 'package:salonverse/UI/Bookings/AfterConfirm/Controller/BookingController.dart';


void main() {
  Get.put(ServiceController());
  Get.put(BookingController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loginsignupscreen(),
    );
  }
}

