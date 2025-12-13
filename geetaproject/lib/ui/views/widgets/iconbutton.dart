import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final bool boolValue;
  CustomIconButton({super.key, required this.icon,required this.onPressed, this.style, required this.boolValue});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: icon, style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
          boolValue
              ? const Color.fromRGBO(36, 36, 38, 1)
              : Colors.black),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        const CircleBorder(
            side: BorderSide(color: Colors.white, width: 1.5)),
      ),
      padding:
      MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(5)),
      iconColor: MaterialStateProperty.all<Color>(Colors.white),
    ), iconSize: 24,);
  }
}
