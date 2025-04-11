import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonverse/Commons/CommonColors.dart';
import 'package:salonverse/Data/Services/SalonServices/ServiceController.dart';
import 'package:salonverse/UI/Category/SalonsByServiceCategory/Screens/Womens/WomensSelectedServiceSalons.dart';

import '../../../../Commons/CommonAssets.dart';
import '../../SalonsByServiceCategory/Screens/Mens/MensSelectedServiceSalons.dart';


class Getservicesbygenderscreen extends StatefulWidget {
  final String categoryType;
  const Getservicesbygenderscreen({super.key, required this.categoryType});

  @override
  State<Getservicesbygenderscreen> createState() => _GetservicesbygenderscreenState();
}


class _GetservicesbygenderscreenState extends State<Getservicesbygenderscreen> {

  late List<String> serviceTitles;
  late List<AssetImage> serviceIcons;

  @override
  void initState() {
    super.initState();
    // Dynamically set data based on categoryType
    if (widget.categoryType == "Men") {
      serviceTitles = mensServiceCategoryTitles;
      serviceIcons = mensServiceCategoryIcons;
    } else if (widget.categoryType == "Women") {
      serviceTitles = womensServiceCategoryTitles;
      serviceIcons = womensServiceCategoryIcons;
    } else {
      serviceTitles = [];
      serviceIcons = [];
    }
  }

  @override
  Widget build(BuildContext context) {

    final size = Size.square(MediaQuery.of(context).size.shortestSide);
    final primarySize = size.shortestSide / 20;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.brownColorApp,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10), // Adjust the radius as needed
                    bottomRight: Radius.circular(10), // Adjust the radius as needed
                  ),
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
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: AppColors.appbarTextColor,
                        ),
                      ),
                      Center(
                        child: Text(
                          "Categories",
                          style: GoogleFonts.kavoon(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.appbarTextColor,
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

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                EdgeInsets.only(left: primarySize, top: 2 * primarySize),
                child: Text(
                  "${widget.categoryType}'s Category",
                  style: GoogleFonts.kavoon(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              //SearchBar
              Padding(
                padding: EdgeInsets.only(
                    left: primarySize,
                    right: primarySize,
                    top: 2 * primarySize),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: AppColors.brownColorApp,
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 0.5,
                          color: Colors.black,
                        )),
                    hintText: "Search Services..",
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: primarySize,
                    right: primarySize,
                    top: 2 * primarySize),
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 35,
                      mainAxisSpacing: 25,
                    ),
                    itemCount: serviceTitles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          String selectedService = serviceTitles[index];
                          Get.find<ServiceController>().filterSalonsByService(selectedService);
                          if(widget.categoryType == "Men") {
                            Get.to(() => Menssalonlistforselectedservice(service: selectedService));
                          } else if(widget.categoryType == "Women") {
                            Get.to(() => Womenssalonlistforselectedservice(service: selectedService));
                          }
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: serviceCategoryColors[
                                  index % serviceCategoryColors.length],
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: mensServiceCategoryIcons[index]),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              serviceTitles[index],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mulish(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.black,),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
