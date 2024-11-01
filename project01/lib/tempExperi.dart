import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project01/VideoFeed/HomeVideos/VideoPlayers/videoPlayer01.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'ContinentsPages/africa_page.dart';
import 'ContinentsPages/antarctica_page.dart';
import 'ContinentsPages/asia_page.dart';
import 'ContinentsPages/australia_page.dart';
import 'ContinentsPages/europe_page.dart';
import 'ContinentsPages/north_ame_page.dart';
import 'ContinentsPages/south_ame_page.dart';
import 'DestinationHomes/beachesHome/beachesHome.dart';
import 'DestinationHomes/heritageHome/heritageHome.dart';
import 'DestinationHomes/hillStationHome/hillStationHome.dart';
import 'DestinationHomes/honeyMoonHome/honeyMoonHome.dart';
import 'DestinationHomes/pilgrimageHome/pilgrimageHome.dart';
import 'DestinationHomes/wildLifeHome/wildLifeHome.dart';
import 'NewsWebViews/BBCwebView/BBCwebViewHome.dart';
import 'NewsWebViews/BUZZFEEDwebView/BuzzFeedWebViewHome.dart';
import 'NewsWebViews/CNNwebView/CNNwebViewHome.dart';
import 'NewsWebViews/FOCUS_WIREwebView/FocusWireWebViewHome.dart';
import 'NewsWebViews/NBCwebView/NBCwebViewHome.dart';
import 'NewsWebViews/REUTERSwebView/ReutersWebViewHome.dart';
import 'NewsWebViews/SKIFTwebView/SkiftWebViewHome.dart';
import 'NewsWebViews/THE_GUARDIANwebView/The_GuardianWebViewHome.dart';
import 'NewsWebViews/THE_INDEPENDENTwebView/The_IndependentWebViewHome.dart';
import 'VideoFeed/HomeVideos/VideoPlayers/webPlayer.dart';
import 'VideoFeed/HomeVideos/VideoPlayers/youtubePlayer.dart';

class Tempexperi extends StatefulWidget {
  const Tempexperi({super.key});

  @override
  State<Tempexperi> createState() => _TempexperiState();
}

class _TempexperiState extends State<Tempexperi> {
  final PageController _pageController = PageController();

  String selectedPage = '';

  final List<String> imgs = [
    'https://media.cntraveler.com/photos/576af69fc06bba921a97a0bc/1:1/w_800%2Cc_limit/Taj-Mahal-GettyImages-485899645.jpg',
    'https://media.cntraveler.com/photos/576af69f558ff1e22af12771/master/w_800%2Cc_limit/Bunaken-Marine-Park-GettyImages-168389000.jpg',
    'https://media.cntraveler.com/photos/576af6a4c06bba921a97a0be/master/w_800%2Cc_limit/Hawa-Mahal-GettyImages-187979190.jpg',
    'https://media.cntraveler.com/photos/576af6a2c06bba921a97a0bd/master/w_800%2Cc_limit/Ajanta-Caves-GettyImages-145598799.jpg',
    'https://media.cntraveler.com/photos/576af69cc06bba921a97a0bb/master/w_800%2Cc_limit/Borobodur-GettyImages-489761774.jpg',
    'https://media.cntraveler.com/photos/576af69b4a3399cb31f9da38/master/w_800%2Cc_limit/Raja-Ampat-GettyImages-497311417.jpg',
  ];
  final List<String> titles = [
    'North America',
    'South America',
    'Africa',
    'Antarctica',
    'Asia',
    'Australia',
    'Europe',
  ];
  final List<String> urls = [
    'https://en.wikipedia.org/wiki/Taj_Mahal',
    'https://en.wikipedia.org/wiki/Bunaken',
    'https://en.wikipedia.org/wiki/Hawa_Mahal',
    'https://en.wikipedia.org/wiki/Ajanta_Caves',
    'https://en.wikipedia.org/wiki/Borobudur',
    'https://en.wikipedia.org/wiki/Raja_Ampat_Islands',
  ];

  final List<String> destinations = [
    'WILD LIFE',
    'HILL STATION',
    'BEACHES',
    'HERITAGE',
    'HONEYMOON',
    'PILGRIMAGE',
  ];

  final List<AssetImage> destinationImages = [
    const AssetImage('assets/destinationsIMAGES/wildLifeCard.jpg'),
    const AssetImage('assets/destinationsIMAGES/hillStationCard.jpg'),
    const AssetImage("assets/destinationsIMAGES/beachCARDed.jpg"),
    const AssetImage("assets/destinationsIMAGES/heritageCard02.jpg"),
    const AssetImage("assets/destinationsIMAGES/HoneyMoonCARDe.jpg"),
    const AssetImage("assets/destinationsIMAGES/pilgrimageCard03.jpg"),
  ];

  final List<AssetImage> destinationGifs = [
    const AssetImage("assets/destinationsIMAGES/GIF's/wildLifeCoolOne.gif"),
    const AssetImage("assets/destinationsIMAGES/GIF's/hillStation_01.gif"),
    const AssetImage("assets/destinationsIMAGES/GIF's/beaches_.gif"),
    const AssetImage("assets/destinationsIMAGES/GIF's/heritage_.gif"),
    const AssetImage("assets/destinationsIMAGES/GIF's/honeyMoon.gif"),
    const AssetImage("assets/destinationsIMAGES/GIF's/pilgrimage_gif.gif"),
  ];

  //https://edition.cnn.com/2024/08/22/world/video/5-things-dnc-covid-mount-fuji
  //https://edition.cnn.com/2024/08/21/world/video/sunken-bayesian-superyacht-missing-bodies-recovery-nadeau-dgivid
  //x5Hha6UglK4
  //Fgi8Q9Puyqc

  final List<String> _youtubeVideoIds = [
    '5HU2UJjtQ-c',
    'x5Hha6UglK4',
    'Fgi8Q9Puyqc', // Add more YouTube video IDs here
  ];

  final List<Map<String, String>> websiteIcons = [
    {
      'name': 'BBC',
      //'url': 'https://www.bbc.com',
      'icon': 'assets/circleIcons/bbcIcon.jpg',
    },
    {
      'name': 'REUTERS',
      //'url': 'https://www.reuters.com/',
      'icon': 'assets/circleIcons/reutersIcon.jpg',
    },
    {
      'name': 'THE GUARDIAN',
      //'url': 'https://www.theguardian.com/international',
      'icon': 'assets/circleIcons/guardianIcon.jpg',
    },
    {
      'name': 'BUZZFEED',
      //'url': 'https://www.buzzfeednews.com/',
      'icon': 'assets/circleIcons/buzzFeedIcon.jpg',
    },
    {
      'name': 'NBC',
      //'url': 'https://www.nbc.com/',
      'icon': 'assets/circleIcons/nbcIcon.jpg',
    },
    {
      'name': 'FOCUS WIRE',
      //'url': 'https://www.phocuswire.com/',
      'icon': 'assets/circleIcons/phocusWireIcon.jpg',
    },
    {
      'name': 'CNN',
      //'url': 'https://edition.cnn.com/',
      'icon': 'assets/circleIcons/cnnIcon.jpg',
    },
    {
      'name': 'SKIFT',
      //'url': 'https://skift.com/',
      'icon': 'assets/circleIcons/skiftIcon.jpg',
    },
    {
      'name': 'THE INDEPENDENT',
      //'url': 'https://www.independent.co.uk/news/world',
      'icon': 'assets/circleIcons/independentIcon.jpg',
    },
  ];



  static const _selectedIndex = 0;

  static const TextStyle OptionStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
  );

  static const List<Widget> widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: OptionStyle,
    ),
    Text(
      'Index 1: Trending',
      style: OptionStyle,
    ),
    Text('Index 2: ')
  ];

  int _currentPage = 0;
  late Timer _timer;
  // initState

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_currentPage < imgs.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        drawer: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white54, // Border color
              width: 0.1,
            ),
          ),
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Text(
                    'Drawer Header',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.message),
                  title: const Text('Messages'),
                  onTap: () {
                    setState(() {
                      selectedPage = 'Messages';
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: const Text('Profile'),
                  onTap: () {
                    setState(() {
                      selectedPage = 'Profile';
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    setState(() {
                      selectedPage = 'Settings';
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: const IconThemeData(
                color: Colors.white, // Change the color of the hamburger icon here
              ),
              floating: false,
              pinned: true,
              snap: false,
              expandedHeight: 100.0,
              backgroundColor: Colors.black.withOpacity(0.9),

              flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  width: 135,
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  margin: const EdgeInsets.only(top: 40, left: 10),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(10)),

                    /*boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 1,
                        blurStyle: BlurStyle.inner,
                      ),
                    ],*/

                  ),
                  child: Text(
                    "Explorearth",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15,
                      letterSpacing: 1,
                    ),

                  ),
                ),
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      if (index == 0) const SizedBox(height: 8.0),
                      if (index == 0) buildContinents(context),
                      if (index == 0) const SizedBox(height: 8.0),
                      if (index == 0) buildSuggestions(context),
                      if (index == 0) const SizedBox(height: 8.0),
                      if (index == 0) buildDestination(context),
                      if (index == 0) const SizedBox(height: 8.0),
                      if (index == 0) buildNewsSources(context),
                      if (index == 0) const SizedBox(height: 8.0),
                      if (index == 0) buildVideosFeed(context),
                    ],
                  );
                },
                childCount:
                    1, // Set this to the number of distinct sections you have
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageContainer(
      BuildContext context, String imagePath, String titleText, int index) {
    return GestureDetector(
      onTap: () {
        Widget page = const Tempexperi();
        switch (index) {
          case 0:
            page = const pageOfNorthAme();
            break;
          case 1:
            page = const pageOfSouthAme();
            break;
          case 2:
            page = const pageOfAfrica();
            break;
          case 3:
            page = const pageOfAntarctica();
            break;
          case 4:
            page = const pageOfAsia();
            break;
          case 5:
            page = const pageOfAustralia();
            break;
          case 6:
            page = const pageOfEurope();
            break;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 65,
                width: 65,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(imagePath),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              titleText,
              style: const TextStyle(color: Colors.white60, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContinents(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.grey, // The color of the line
          thickness: 0.2, // The thickness of the line
        ),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              'Continents',
              textAlign: TextAlign.left,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ]),
        ),
        const SizedBox(height: 8.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          //padding: const EdgeInsets.only(bottom: 10),

          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            margin: const EdgeInsets.only(top: 0.5),
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.rectangle,

              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  blurRadius: 3,
                  blurStyle: BlurStyle.solid,
                ),
              ],
            ),
            child: Row(
              children: List.generate(titles.length, (index) {
                return _buildImageContainer(
                  context,
                  "assets/continentsFor/${titles[index].toLowerCase().replaceAll(' ', '_')}.png",
                  titles[index],
                  index,
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSuggestions(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              'Suggestions',
              textAlign: TextAlign.left,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ]),
        ),
        const SizedBox(height: 8.0),
        Column(
          children: [
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.symmetric(vertical: 3),

                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.white,
                          width: 0.1,
                        ),
                    ),
                    child: TextScroll(
                      "EXPLORE SOME OF THE BREATHTAKING LANDSCAPES OF ASIA'S MOST ICONIC DESTINATIONS.",
                      intervalSpaces: 5,
                      velocity: const Velocity(pixelsPerSecond: Offset(50, 0)),
                      fadedBorder: true,
                      fadeBorderVisibility: FadeBorderVisibility.auto,
                      fadeBorderSide: FadeBorderSide.both,
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Card(
                        margin: const EdgeInsets.only(
                            top: 5, left: 10, right: 10, bottom: 10
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            child: PageView.builder(
                              controller: _pageController,
                              itemCount: imgs.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    _launchURL(urls[index]);
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(imgs[index]),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildDestination(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              'Destinations',
              textAlign: TextAlign.left,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ]),
        ),

        const SizedBox(height: 8.0),

        Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          height: 175,

          decoration: const BoxDecoration(
            color: Colors.black,
          ),

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  InkWell(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const wildlifeHOME()),
                        );
                      } else if (index == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const hillStationHOME()),
                        );
                      } else if (index == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const beachesHOME()),
                        );
                      } else if (index == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const heritageHOME()),
                        );
                      } else if (index == 4) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const honeyMoonHOME()),
                        );
                      } else if (index == 5) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const pilgrimageHOME()),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Tempexperi()),
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5.5),
                      width: 125,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                          width: 0.15,
                        ),
                        image: DecorationImage(
                          image: destinationGifs[index],
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.9),
                            BlendMode.darken,
                          ),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            blurStyle: BlurStyle.solid,
                            color: Colors.white,
                            blurRadius: 1,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 40,
                                padding: const EdgeInsets.all(15),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: Colors.white, // Border color
                                    width: 4.9,
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                alignment: Alignment.center,
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    //shape: BoxShape.rectangle,

                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    border: Border.all(
                                      color: Colors.white70,
                                      width: 0.3,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 1,
                                        blurStyle: BlurStyle.inner,
                                      )
                                    ]),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    destinations[index],
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      letterSpacing: 0.5,
                                      color: Colors.white,
                                      shadows: [
                                        const Shadow(
                                          blurRadius: 25,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildNewsSources(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              'News Sources',
              textAlign: TextAlign.left,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ]),
        ),
        const SizedBox(height: 8.0),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          height: 130, // Set a fixed height for the container

          decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                color: Colors.white54,
                width: 0.1,
              )
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: websiteIcons.length,
            itemBuilder: (context, index) {
              final website = websiteIcons[index];
              return GestureDetector(
                onTap: () {
                  // Handle navigation based on the index
                  if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BBCHome()),
                    );
                  } else if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const reutersHome()),
                    );
                  } else if (index == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const theGuardianHome()),
                    );
                  } else if (index == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const buzzFeedHome()),
                    );
                  } else if (index == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NBCHome()),
                    );
                  } else if (index == 5) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const focusWireHome()),
                    );
                  } else if (index == 6) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CNNHome()),
                    );
                  } else if (index == 7) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const skiftHome()),
                    );
                  } else if (index == 8) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const theIndependentHome()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Tempexperi()),
                    );
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurStyle: BlurStyle.outer,
                              color: Colors.white,
                              blurRadius: 0.9,
                              offset: Offset(0.2, 0.2),
                            )
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            website['icon']!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        website['name']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                        ),
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

  Widget buildVideosFeed(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              'Videos',
              textAlign: TextAlign.left,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ]),
        ),
        const SizedBox(height: 8),
        Column(
          children: [
            Container(
              height: 120,
            )
          ],
        ),
      ],
    );
  }
}
