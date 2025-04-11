import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CommonColors.dart';

class FontStyles{


  // Base method to reduce repetition
  // static TextStyle _baseStyle({
  //   required double fontSize,
  //   required FontWeight fontWeight,
  //   required Color color,
  // }) {
  //   return GoogleFonts.mulish(
  //     fontSize: fontSize,
  //     fontWeight: fontWeight,
  //     color: color,
  //   );
  // }


  static final TextStyle w400_24_black = GoogleFonts.mulish(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black
  );
  static final TextStyle bold_20_commonColor = GoogleFonts.mulish(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.brownColorApp,
  );
  static final TextStyle w300_15_black = GoogleFonts.mulish(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.black
  );

  static final TextStyle w400_15_black = GoogleFonts.mulish(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.black38
  );

  static final TextStyle bold_24_black = GoogleFonts.mulish(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black
  );

  static final TextStyle w700_15_black = GoogleFonts.mulish(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: AppColors.brownColorApp,
  );

  static final TextStyle w700_15_blackbold = GoogleFonts.mulish(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: Colors.black
  );

  static final TextStyle w700_15_white = GoogleFonts.mulish(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: Colors.white
  );

  static final TextStyle w400_20_white = GoogleFonts.mulish(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white
  );

  static final TextStyle w700_20_grey = GoogleFonts.mulish(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.grey
  );

  static final TextStyle w700_15_grey = GoogleFonts.mulish(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: Colors.grey
  );

  static final TextStyle w400_18_grey = GoogleFonts.mulish(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Colors.black54
  );

}