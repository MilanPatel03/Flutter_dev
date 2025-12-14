import 'package:flutter/material.dart';
import 'package:project01/Commons/padding.dart';
import 'package:project01/Home/widgets/section_title.dart';

class VideosSection extends StatelessWidget {

  const VideosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SectionTitle("Videos"),

        const SizedBox(height: 8),

        // ----------------- HEADER ROW -----------------
        Padding(
          padding: AppPadding.centerPaddingHorizontal50(context),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xff1f1f1f),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Text(
                      "trending",
                      style: TextStyle(fontSize: 12, color: Colors.white70, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.trending_up_rounded, color: Colors.orangeAccent.shade200),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  "See More >",
                  style: TextStyle(color: Colors.white70,fontSize: 12,fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        Padding(
          padding: AppPadding.centerPaddingHorizontal50(context),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 12,
            itemBuilder: (BuildContext context, int index) {

              return Container(
                height: 120,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Row(
                  children: [

                    //THUMBNAIL
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(14)),
                        image: DecorationImage(
                          image: AssetImage("assets/videos/thumb_${index % 4}.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //RIGHT SIDE TEXT
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                      
                            Text(
                              "Travel the World • Episode ${index + 1}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13.5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                      
                            const Text(
                              "Explore breathtaking destinations, cultures & adventures.",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 11.5,
                              ),
                            ),
                      
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                      
                                const Row(
                                  children: [
                                    Icon(Icons.access_time,
                                        size: 13, color: Colors.white38),
                                    SizedBox(width: 4),
                                    Text(
                                      "8 min",
                                      style: TextStyle(
                                          color: Colors.white38, fontSize: 11),
                                    ),
                                  ],
                                ),
                      
                                Icon(Icons.play_circle_fill,
                                    size: 28,
                                    color: Colors.orangeAccent.shade200),
                              ],
                            ),
                      
                          ],
                        ),
                      ),
                    )
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
