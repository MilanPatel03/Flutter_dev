import 'package:flutter/material.dart';

class AppPadding {
  static EdgeInsets left(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return EdgeInsets.only(left: w * 0.05);
  }
  static EdgeInsets centerPaddingHorizontal75(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return EdgeInsets.symmetric(horizontal: w * 0.075);
  }
  static EdgeInsets centerPaddingHorizontal25(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return EdgeInsets.symmetric(horizontal: w * 0.025);
  }
  static EdgeInsets centerPaddingHorizontal50(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return EdgeInsets.symmetric(horizontal: w * 0.050);
  }
  static EdgeInsets centerPaddingOverall25(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.width;
    return EdgeInsets.symmetric(horizontal: w * 0.025,vertical: h * 0.025);
  }
}
