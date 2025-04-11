import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Commons/CommonColors.dart';

class Genderselectionwidget extends StatelessWidget {


  final bool isChecked;
  final VoidCallback onTap;
  final String label;
  final String imagePath;
  final EdgeInsets margin;
  final EdgeInsets checkmarkPosition;

  const Genderselectionwidget({
    super.key,
    required this.isChecked,
    required this.onTap,
    required this.label,
    required this.imagePath,
    this.margin = const EdgeInsets.only(left: 25),
    this.checkmarkPosition = const EdgeInsets.only(top: 8, right: 8),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                width: 140,
                margin: margin,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 0.5,
                    color: isChecked
                        ? AppColors.brownColorApp
                        : AppColors.borderColorOfMenContainer,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SvgPicture.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: checkmarkPosition.top,
                right: checkmarkPosition.right,
                child: Container(
                  width: 21,
                  height: 21,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.brownColorApp,
                    border: Border.all(color: Colors.transparent),
                  ),
                  child: isChecked
                      ? Padding(
                    padding: const EdgeInsets.all(3.5),
                    child: SvgPicture.asset(
                      'assets/SalonAppAssets/IconsHomeScreen/checkmarkSvg1.svg',
                      fit: BoxFit.fill,
                    ),
                  )
                      : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Container(
            width: 140,
            margin: margin,
            child: Center(
              child: Text(
                label,
                style: GoogleFonts.kavoon(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
