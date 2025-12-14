import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Comet extends StatelessWidget {
  const Comet();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.4, // tilt for diagonal "shooting star" look
      child: SizedBox(
        width: 70,
        height: 15,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            // Tail
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.transparent,
                      Color(0x33FFFFFF), // faint tail start
                      Color(0x88FFAB40), // your orange
                      Color(0xFFFFAB40), // bright near head
                    ],
                  ),
                ),
              ),
            ),
            // Head
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFFFAB40),
                    blurRadius: 16,
                    spreadRadius: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

