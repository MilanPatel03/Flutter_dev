import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';


class Nascrollview extends StatefulWidget {
  const Nascrollview({super.key});

  @override
  State<Nascrollview> createState() => _NascrollviewState();
}

class _NascrollviewState extends State<Nascrollview> {
  final List<String> site1 = [
    'https://i.natgeofe.com/n/2b52679e-982b-439d-b050-ff0d9cc91f3b/amazing-places-na-cape-royal.jpg?w=2560&h=1812',
    'https://i.natgeofe.com/n/17276090-4b9e-42ee-be73-9fb16fdbca2e/citylifemontreal.jpg?w=2560&h=1706',
    'https://media.cntraveler.com/photos/65485e5953c2576a4e20f893/16:9/w_1920%2Cc_limit/Big-Sur-thomas-ciszewski-erApmfRX7eo-unsplash.jpg',
    'https://images.travelandleisureasia.com/wp-content/uploads/sites/2/2023/07/17233623/banff.jpg?tr=w-1280,f-jpg,pr-true',
    'https://cdn.mos.cms.futurecdn.net/X8973EA7QetDKH5ZrYbVTF-970-80.jpg.webp',
    'https://media.cntraveler.com/photos/5bb4e2816477eb358f142ca4/16:9/w_1920%2Cc_limit/Great-Sand-Dunes-GettyImages-1034057512.jpg',
    'https://www.worldatlas.com/r/w960-q80/upload/7b/8c/50/shutterstock-1060717751.jpg',
    'https://cdn.outsideonline.com/wp-content/uploads/2023/04/travel-awards-colorado-plateau_h.jpg?crop=16:9&width=1600&enable=upscale&quality=100',
  ];

  final List<String> titles = [
    'Cape Royal is a beautiful place to visit and enjoy the stunning views.',
    'Montreal offers a vibrant mix of culture, food, and history.',
    'Big Sur is renowned for its dramatic coastline and breathtaking vistas.',
    'Banff National Park is a UNESCO World Heritage site in Canada.',
    'Wildfire North America can be seen from space due to its vast size.',
    'Great Sand Dunes is known for its towering dunes and diverse ecosystem.',
    'Largest Cities in North America are bustling hubs of activity and culture.',
    'Colorado Plateau is home to stunning rock formations and national parks.',
  ];

  final List<String> websiteTitles = [
    'National Geographic',
    'National Geographic',
    'Condé Nast Traveler',
    'Travel + Leisure',
    'Space',
    'Condé Nast Traveler',
    'World Atlas',
    'Outside Online',
  ];

  final List<String> urlsNA = [
    'https://www.nationalgeographic.com/travel/article/your-shot-photos-amazing-places',
    'https://www.nationalgeographic.com/travel/article/guide-to-montreal-restaurants-hotels-shopping',
    'https://www.cntraveler.com/galleries/2016-07-04/the-50-most-beautiful-places-in-america',
    'https://www.travelandleisureasia.com/in/destinations/north-america/the-most-beautiful-places-in-canada/',
    'https://www.space.com/satellite-image-wildfire-north-america',
    'https://www.cntraveler.com/gallery/us-national-parks-in-photos',
    'https://www.worldatlas.com/articles/largest-cities-in-north-america.html',
    'https://www.outsideonline.com/adventure-travel/destinations/north-america/best-places-to-visit-in-us-for-adventure/',
  ];

  void _launchNAURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showComments(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Comments',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Add a comment',
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        );
      },
    );
  }
  void _shareContent(String url) {
    Share.share('Check out this amazing place: $url');
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: ListView.builder(
          itemCount: site1.length,
          padding: const EdgeInsets.all(10.0),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _launchNAURL(urlsNA[index]);
              },
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(site1[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),),
                          child: Text(
                            titles[index],
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    offset: Offset(1, 1.5),
                                    color: Colors.black54,
                                  ),
                                ],
                              ),
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    padding: const EdgeInsets.only(left: 15, right: 5, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            websiteTitles[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              iconSize: 20,
                              icon: const Icon(Icons.comment, color: Colors.white),
                              onPressed: () {
                                _showComments(context);
                              },
                            ),
                            IconButton(
                              iconSize: 20,
                              icon: const Icon(Icons.share, color: Colors.white),
                              onPressed: () {
                                _shareContent(urlsNA[index]);
                              },
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
