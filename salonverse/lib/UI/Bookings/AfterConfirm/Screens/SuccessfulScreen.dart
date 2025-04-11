import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonverse/UI/Home/Screens/HomeScreen.dart';

import '../../../../Commons/CommonColors.dart';

class Successfulscreen extends StatelessWidget {
  const Successfulscreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            padding: const EdgeInsets.all(35),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              color: Colors.green,
            ),
            child: SizedBox(
              child: Image.asset("assets/animations/check-mark-successful.webp",fit: BoxFit.contain,),
            ),
          ),
          const Gap(20),
          Text("Booking Confirmed!",
            style: GoogleFonts.kavoon(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.brownColorApp,
          ),),
          const Gap(20),
          GestureDetector(
            onTap: (){
              Get.to(const homepage());
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: Get.size.width*0.2),
              decoration: BoxDecoration(
                color: Colors.brown[50],
                border:
                    Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(child: Text("Continue"),),
            ),
          )
        ],
      ),
    );
  }
}
