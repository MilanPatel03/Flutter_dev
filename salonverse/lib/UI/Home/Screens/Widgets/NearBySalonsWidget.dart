import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../../../Commons/CommonColors.dart';
import '../HomeScreen.dart';



class Nearbysalonswidget extends StatelessWidget {
  final List<String> nearbySalonNames;
  final List<String> nearbySalonLocations;
  final List<AssetImage> nearBySalons;
  final double primarySize;
  final bool isMenSelected;
  final bool isWomenSelected;

  const Nearbysalonswidget({
    Key? key,
    required this.nearbySalonNames,
    required this.nearbySalonLocations,
    required this.nearBySalons,
    required this.primarySize,
    required this.isMenSelected,
    required this.isWomenSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          // TITLE
          Container(
            margin: EdgeInsets.only(
              top: primarySize,
              left: primarySize,
              right: primarySize,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Near by salon",
                  style: GoogleFonts.kavoon(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "See All >>",
                    style: GoogleFonts.mulish(
                      color: AppColors.brownColorApp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          //CARDS
          SizedBox(
            height: 256,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: nearbySalonNames.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          if (index == 0 || index == 1 || index == 2) {
                            // do something
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const homepage()),
                            );
                          }
                        },
                        child: _buildNearbyCard(
                          backgroundImage: nearBySalons[index],
                          salonName: nearbySalonNames[index],
                          location: nearbySalonLocations[index],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNearbyCard({required AssetImage backgroundImage, required String salonName, required String location,}) {

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 6,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 290,
            height: 190,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
              border: Border.all(width: 0.5, color: Colors.black),
              image: DecorationImage(
                image: backgroundImage,
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.9),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Container(
            height: 45,
            width: 290,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              border: Border.symmetric(
                horizontal: BorderSide(color: Colors.black, width: 0.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        salonName,
                        style: GoogleFonts.mulish(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        location,
                        style: GoogleFonts.mulish(
                          fontSize: 10,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(), // optional right side
              ],
            ),
          ),
        ],
      ),
    );
  }

}
