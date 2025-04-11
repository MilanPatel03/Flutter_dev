import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonverse/Commons/CommonColors.dart';
import 'package:salonverse/UI/Bookings/AfterConfirm/Screens/BookingHistoryScreen.dart';
import 'package:salonverse/UI/Category/ServiceCategoryByGender/Screens/GetServiceCategoriesByGenderScreen.dart';
import 'package:salonverse/UI/Category/ServiceCategoryByGender/Screens/GetServicesByGenderScreen.dart';
import 'package:salonverse/UI/Profile/Screens/myProfile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../Commons/CommonAssets.dart';
import '../../Profile/Controller/GetProfileController.dart';
import 'Widgets/HomepageBodySection.dart';
import 'Widgets/SearchbarWidget.dart';


class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  String locationOfUser = "Ahmedabad";
  final GetProfileController profileController = Get.put(GetProfileController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.screenColor,
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Obx(() {
              var profile = profileController.oldResponse.value.data;

              return UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: AppColors.brownColorApp),
                accountName: Text(
                  "${profile?.firstName ?? ''} ${profile?.lastName ?? ''}",
                  style: GoogleFonts.poppins(),
                ),
                accountEmail: Text(profile?.email ?? ''),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: profileController.getProfileImage != null &&
                      profileController.getProfileImage!.isNotEmpty
                      ? NetworkImage(profileController.getProfileImage!)
                      : null,
                  child: profileController.getProfileImage == null ||
                      profileController.getProfileImage!.isEmpty
                      ? Icon(Icons.person, color: AppColors.brownColorApp)
                      : null,
                ),
              );
            }),

            drawerTile(Icons.home, 'Home', () => Get.to(() => const homepage(),),),
            drawerTile(Icons.edit_rounded, 'Edit Profile', () => Get.to(() => MyProfileScreen())),
            drawerTile(Icons.history, 'Booking History', () => Get.to(() => BookingHistoryScreen())),
            drawerTile(Icons.logout, 'Log Out', () {
              Navigator.pop(context);
            }),
          ],
        ),
      ),

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            stretch: true,
            centerTitle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
            ),
            iconTheme: const IconThemeData(
              color: AppColors.appbarTextColor,
            ),
            floating: false,
            pinned: false,
            snap: false,
            expandedHeight: 120.0,
            backgroundColor: AppColors.brownAppBarFaded,
            automaticallyImplyLeading: true,
            flexibleSpace: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: FlexibleSpaceBar(
                background: Container(
                  color: AppColors.brownAppBarFaded,
                ),
                title: Container(
                  width: 135,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin: const EdgeInsets.only(top: 45, left: 0),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 15,
                        color: AppColors.appbarTextColor,
                      ),
                      Text(
                        locationOfUser,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          color: AppColors.appbarTextColor,
                          fontSize: 12,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(
                      color: AppColors.appbarTextColor,
                      Icons.notifications,
                      size: 25.0, // Change the icon size
                    ),
                    onPressed: () {
                      // Handle notification icon tap
                    },
                  ),
                  Positioned(
                    right: 11,
                    top: 11,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: const Text(
                        '1', // Badge text
                        style: TextStyle(
                          color: AppColors.appbarTextColor,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 8.0),
                Searchbarwidget(),
                const SizedBox(height: 8.0),
                const Homepagebodysection(),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
