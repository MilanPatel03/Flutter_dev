
import 'package:flutter/material.dart';

class Commons {

  static Widget customDivider({
    Color color = Colors.white,
    double thickness = 0.1,
    double height = 5.5,
    double indent = 1,
    double endIndent = 1,
  }) {
    return Divider(
      color: color,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      height: height,
    );
  }



}
