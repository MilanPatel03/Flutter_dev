import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project01/Commons/padding.dart';
import 'package:project01/Home/widgets/section_title.dart';

import '../../Commons/news_routes.dart';

class NewsSection extends StatelessWidget {
  final List<Map<String, String>> websiteIcons;

  const NewsSection({
    super.key,
    required this.websiteIcons,
  });

  @override
  Widget build(BuildContext context) {

    final accentColor = Colors.orangeAccent;
    final orange200 = Colors.orangeAccent.shade200;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height*0.025),

        const SectionTitle("News Sources"),

        SizedBox(height: MediaQuery.sizeOf(context).height*0.025),

        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: websiteIcons.length,
            itemBuilder: (_, index) {
              final site = websiteIcons[index];

              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => newsRoutes[index]!,
                  ),
                ),
                child: Padding(
                  padding: AppPadding.centerPaddingHorizontal50(context),
                  child: Column(
                    children: [
                      Container(
                        width: 74,
                        height: 74,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white60, width: 1),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            site['icon']!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        site['name']!,
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
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
