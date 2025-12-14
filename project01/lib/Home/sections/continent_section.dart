// lib/sections/continents_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project01/Commons/padding.dart';
import 'package:project01/ContinentsPages/continent_page.dart';
import 'package:project01/Home/widgets/section_title.dart';

class ContinentsSectionDummy extends StatelessWidget {
  const ContinentsSectionDummy({super.key});

  static const _accentColor = Colors.orangeAccent;

  final List<_ContinentData> _continents = const [
    _ContinentData(
      name: "Africa",
      assetPath: "assets/continentsFor/africaco_.svg",
    ),
    _ContinentData(
      name: "North America",
      assetPath: "assets/continentsFor/northamericaco_.svg",
    ),
    _ContinentData(
      name: "South America",
      assetPath: "assets/continentsFor/southamericaco_.svg",
    ),
    _ContinentData(
      name: "Asia",
      assetPath: "assets/continentsFor/asiaco_.svg",
    ),
    _ContinentData(
      name: "Australia",
      assetPath: "assets/continentsFor/australiaco_.svg",
    ),
    _ContinentData(
      name: "Europe",
      assetPath: "assets/continentsFor/europeco_.svg",
    ),
    _ContinentData(
      name: "Antarctica",
      assetPath: "assets/continentsFor/antarcticaco_.svg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final orange200 = Colors.orangeAccent.shade200;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const SectionTitle("Continents"),
        const SizedBox(height: 20),

        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _continents.length,
            itemBuilder: (context, index) {
              final continent = _continents[index];

              return Padding(
                padding: AppPadding.centerPaddingHorizontal50(context),
                child: Column(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        Get.to(
                              () => ContinentPage(selectedContinent: continent.name),
                        );
                      },
                      child: Container(
                        width: 74,
                        height: 74,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.3),
                          border: Border.all(color: Colors.white60, width: 1),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            continent.assetPath,
                            // let SVG colors handle theme: dark globe + a bit of orange
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      continent.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ContinentData {
  final String name;
  final String assetPath;

  const _ContinentData({
    required this.name,
    required this.assetPath,
  });
}
