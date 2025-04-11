import 'package:flutter/material.dart';


class AppColors {
  static const Color appbarTextColor = Colors.white;
  static const Color brownAppBar = Color(0xFFAF7F1F);
  static const Color brownColorApp = const Color(0xFFAF7F1F);
  static const Color screenColor = const Color(0xFFFFFFFF);


  // Brown with opacity as a getter (if needed)
  static Color get brownAppBarFaded => brownAppBar.withOpacity(0.9);

  static const Color borderColorOfMenContainer = Colors.black38;
  static const Color borderColorOfWomenContainer = Colors.black38;

  static const List<Color> cardColors = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
  ];



}
