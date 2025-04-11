import 'package:flutter/material.dart';

class Autoswipecard extends StatelessWidget {
  final ImageProvider backgroundImage;
  const Autoswipecard({super.key, required this.backgroundImage});

  @override
  Widget build(BuildContext context) {

    final size = Size.square(MediaQuery.of(context).size.shortestSide);
    final primarySize = size.shortestSide / 20;

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            image: DecorationImage(
              image: backgroundImage,
              fit: BoxFit.cover,
              colorFilter:
              const ColorFilter.mode(Colors.black12, BlendMode.darken),
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: 10,
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.transparent),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 3.5,
                  blurRadius: 15,
                  blurStyle: BlurStyle.outer,
                ),
              ],
              image: const DecorationImage(
                image: AssetImage(
                  "assets/SalonAppAssets/IconsHomeScreen/50%offbdge.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
