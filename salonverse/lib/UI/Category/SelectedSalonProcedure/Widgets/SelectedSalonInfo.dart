import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonverse/Commons/CommonColors.dart';
import 'package:salonverse/UI/Category/SelectedSalonProcedure/Widgets/Tabs/SelectedSalonTabbar.dart';

import '../../../../Commons/SalonsModel.dart';

class Selectedsaloninfo extends StatelessWidget {
  final int index;
  final Salon salon;
  const Selectedsaloninfo({super.key, required this.index, required this.salon});

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            const SizedBox(height: 8.0),
            salonPicContainer(context),
            const SizedBox(height: 8.0),
          ],
        );
  }

  Widget salonPicContainer(BuildContext context) {
    final selectedSalon = salon;

    final size = Size.square(MediaQuery.of(context).size.shortestSide);
    final primarySize = size.shortestSide / 20;

    return Column(
      children: [
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: primarySize),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(selectedSalon.imageURL),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        SizedBox(height: primarySize / 2),
        Text(
          selectedSalon.name, // Use the selected salon's name
          style: GoogleFonts.kavoon(
            color:  AppColors.brownColorApp,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: primarySize / 4),
        Text(
          selectedSalon.location, // Optional: show the salon's location
          style: GoogleFonts.mulish(
            color: Colors.black45,
            fontSize: 14,
          ),
        ),
        Selectedsalontabbar(salon: selectedSalon,),
      ],
    );
  }
}
