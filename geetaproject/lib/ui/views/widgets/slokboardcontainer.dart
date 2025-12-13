import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlokboardContainer extends StatelessWidget {
  final double width;
  final double height;
  final String slok;
  final String transliteration;

  const SlokboardContainer({
    super.key,
    required this.width,
    required this.height,
    required this.slok,
    required this.transliteration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.90,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: CupertinoColors.black),
        image: const DecorationImage(
          image: AssetImage("assets/images/slokboarddd.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: height * 0.015),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.065,
        vertical: height * 0.045,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Text(
              slok,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Text(
              transliteration,
              style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
