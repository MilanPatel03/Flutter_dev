import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../Commons/CommonAssets.dart';
import '../../../../Commons/CommonColors.dart';
import '../../../Category/ServiceCategoryByGender/Screens/GetServicesByGenderScreen.dart';
import 'AutoSwipeCard.dart';
import 'GenderSelectionWidget.dart';
import 'NearBySalonsWidget.dart';

class Homepagebodysection extends StatefulWidget {
  const Homepagebodysection({super.key});

  @override
  State<Homepagebodysection> createState() => _HomepagebodysectionState();
}

class _HomepagebodysectionState extends State<Homepagebodysection> {

  late PageController _pageController;
  bool isChecked01 = false;
  bool isChecked02 = false;
  bool isMenSelected = false;
  bool isWomenSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pageController = PageController(initialPage: 0);
    late Timer _timer;
    int _currentPage = 0;

    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < AppColors.cardColors.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 1300),
        curve: Curves.easeInOut,
      );
    });
  }

  void _toggleCheckMark01() {
    setState(() {
      isChecked01 = true;
      isChecked02 = false;
      isMenSelected = true;
      isWomenSelected = false;
    });
  }
  void _toggleCheckMark02() {
    setState(() {
      isChecked02 = true;
      isChecked01 = false;
      isWomenSelected = true;
      isMenSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {


    final size = Size.square(MediaQuery.of(context).size.shortestSide);
    final primarySize = size.shortestSide / 20;


    return Column(
      children: [

        //AutoCardSwipe
        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 10),
          child: SizedBox(
            height: 200,
            child: Stack(
              children: [
                //CARD'S
                PageView.builder(
                    controller: _pageController,
                    itemCount: AppColors.cardColors.length,
                    itemBuilder: (context, index) {
                      return Autoswipecard(
                        backgroundImage: cardOfHomePageImages[index],
                      );
                    }),

                //Dots EFFECT
                Positioned(
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 210),
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
                        effect: const ExpandingDotsEffect(
                          spacing: 6.0,
                          radius: 12.0,
                          dotHeight: 6,
                          dotWidth: 6,
                          paintStyle: PaintingStyle.fill,
                          strokeWidth: 2.5,
                          activeDotColor: AppColors.brownColorApp,
                          dotColor: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 8.0),

        //GENDER Selection Section
        Container(
          height: 335,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              //SERVICE CATEGORY TEXT
              Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: primarySize),
                padding: EdgeInsets.symmetric(horizontal: primarySize),
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(image: AssetImage("assets/SalonAppAssets/IconsHomeScreen/scissors.png")),
                    Text("Service Category",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.kavoon(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Image(image: AssetImage("assets/SalonAppAssets/IconsHomeScreen/straightner.png")),
                  ],
                ),
              ),

              //2 CONTAINERS
              Container(
                padding: EdgeInsets.symmetric(vertical: primarySize),
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Men's
                    Genderselectionwidget(
                      isChecked: isChecked01,
                      onTap: _toggleCheckMark01,
                      label: "Men's",
                      imagePath: "assets/SalonAppAssets/IconsHomeScreen/menCareSvg.svg",
                      margin: const EdgeInsets.only(left: 25),
                      checkmarkPosition: const EdgeInsets.only(top: 8, right: 8),
                    ),
                    //Women's
                    Genderselectionwidget(
                      isChecked: isChecked02,
                      onTap: _toggleCheckMark02,
                      label: "Women's",
                      imagePath: "assets/SalonAppAssets/IconsHomeScreen/womencareSvg.svg",
                      margin: const EdgeInsets.only(right: 25),
                      checkmarkPosition: const EdgeInsets.only(top: 8, right: 33),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // SEE ALL BUTTON
        Center(
          child: GestureDetector(
            onTap: () {
              if (isMenSelected) {
                Get.to(() => const Getservicesbygenderscreen(categoryType: "Men"));
              } else if (isWomenSelected) {
                Get.to(() => const Getservicesbygenderscreen(categoryType: "Women"));
              }
            },
            child: Container(
              height: 30,
              width: 120,
              margin: EdgeInsets.symmetric(vertical: primarySize),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 0.5,
                  color: AppColors.brownColorApp,
                ),
              ),
              child: Center(
                child: Text(
                  "See All >>",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mulish(
                    color: AppColors.brownColorApp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),

        //NEAR BY Salons
        Nearbysalonswidget(nearbySalonNames: nearbySalonNames, nearbySalonLocations: nearbySalonLocations, nearBySalons: nearBySalons, primarySize: primarySize, isMenSelected: isMenSelected, isWomenSelected: isWomenSelected)
      ],
    );
  }
}
