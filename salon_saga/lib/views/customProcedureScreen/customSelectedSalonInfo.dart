import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/salonServiceModel.dart';

class Customselectedsaloninfo extends StatefulWidget {
  final int index;
  final Salon salon;

  const Customselectedsaloninfo(
      {super.key, required this.index, required this.salon});

  @override
  State<Customselectedsaloninfo> createState() => _CustomselectedsaloninfoState();
}

class _CustomselectedsaloninfoState extends State<Customselectedsaloninfo> {
  Color appbarTextColor = Colors.white;
  Color brownColorOfAppBar = const Color(0xFFAF7F1F).withOpacity(0.9);
  Color brownColorApp = const Color(0xFFAF7F1F);
  Color screenColor = const Color(0xFFFFFFFF);
  String locationOfUser = "Ahmedabad";

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
    final salon = widget.salon;

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
              image: AssetImage(salon.imageURL),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        SizedBox(height: primarySize / 2),
        Text(
          salon.name, // Use the selected salon's name
          style: GoogleFonts.kavoon(
            color: brownColorApp,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: primarySize / 4),
        Text(
          salon.location, // Optional: show the salon's location
          style: GoogleFonts.mulish(
            color: Colors.black45,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
