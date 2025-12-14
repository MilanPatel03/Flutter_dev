import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Commons/padding.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.left(context),
      child: Text(
        title,
        style: GoogleFonts.roboto(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
