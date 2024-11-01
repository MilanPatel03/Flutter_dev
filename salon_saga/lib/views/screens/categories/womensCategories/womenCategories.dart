import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class Womenservicecategories extends StatefulWidget {
  const Womenservicecategories({super.key});

  @override
  State<Womenservicecategories> createState() => _WomenservicecategoriesState();
}

class _WomenservicecategoriesState extends State<Womenservicecategories> {

  Color appbarTextColor = Colors.white;
  Color brownColorOfAppBar = const Color(0xFFAF7F1F).withOpacity(0.9);
  Color brownColorApp = const Color(0xFFAF7F1F);
  Color screenColor = const Color(0xFFFFFFFF);
  String locationOfUser = "Ahmedabad";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                color: brownColorOfAppBar,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: appbarTextColor,
                      ),
                    ),
                    Center(
                      child: Text(
                        "Categories",
                        style: GoogleFonts.kavoon(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: appbarTextColor,
                        ),
                      ),

                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
      body: const Center(child: Text("Womens"),),
    );
  }
}
