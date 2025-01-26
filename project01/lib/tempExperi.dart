import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';

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

class Tempexperi extends StatefulWidget {
  const Tempexperi({super.key});

  @override
  State<Tempexperi> createState() => _TempexperiState();
}

class _TempexperiState extends State<Tempexperi> with TickerProviderStateMixin {
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
    'America',
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
    'Wild Life',
    'Hill Station',
    'Beaches',
    'Heritage',
    'Honeymoon',
    'Pilgrimage',
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
    Text(
      'Index 2: Settings',
      style: OptionStyle,
    )
  ];

  late AnimationController _lottieController;
  bool _isPaused = false;
  int _currentPage = 0;
  late Timer _timer;

  Future<void> _pauseAnimation() async {
    setState(() {
      _isPaused = true;
    });

    // Pause the animation
    _lottieController.stop();

    // Wait for 5 seconds
    await Future.delayed(const Duration(seconds: 5));

    // Resume the animation
    _lottieController.reset();
    _lottieController.forward();

    setState(() {
      _isPaused = false;
    });
  }

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

    //Initialize Lottie Controller _lottieController
    _lottieController = AnimationController(vsync: this);

    // Initialize the controller
    _lottieController = AnimationController(vsync: this);

    // Listen for animation completion to add a delay
    _lottieController.addStatusListener((status) {
      if (status == AnimationStatus.completed && !_isPaused) {
        _pauseAnimation();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    _lottieController.dispose();
    super.dispose();
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //MATERIAL APP

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff181818),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
          
                floating: false,
                pinned: true,
                snap: false,
                expandedHeight: MediaQuery.of(context).size.height * 0.17,
                toolbarHeight: MediaQuery.of(context).size.height * 0.16,
                backgroundColor: Colors.black,
          
                flexibleSpace: Stack(
                  children: [
                    FlexibleSpaceBar(
                      background: ClipRRect(
                        child: ClipPath(
                          // Clipped section with a foreground image and title
                          //clipper: InvertedRoundedClipper(),
                          child: Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.55,
                                width: MediaQuery.of(context).size.width * 0.45,
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.width * 0.055,
                                    left: MediaQuery.of(context).size.width * 0.275,
                                    bottom: MediaQuery.of(context).size.width * 0.05
                                ),
                                decoration: const BoxDecoration(
                                  gradient: RadialGradient(
                                    colors: [
                                      Color(0xffd65050), //Color(0xffd65050),
                                      Color(0xffffa700), // Start of glow
                                      Colors.transparent,
                                    ],
                                    center: Alignment.center,
                                    radius: 0.35,
                                  ),
                                ),
                              ),
                              Container(
                                height: 85,
                                width: 85,
                                margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width * 0.09,
                                  left: MediaQuery.of(context).size.width * 0.500,
                                  bottom: MediaQuery.of(context).size.width * 0.05,
                                ),
                                padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.5),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/destinationsIMAGES/earthtop.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Centered title
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.25), // Semi-transparent dark background
                        borderRadius: BorderRadius.circular(12), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15), // Subtle fade effect
                            blurRadius: 0.5,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Text(
                        "Explorearth",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
          
          
              ),
          
              //SLIVERLIST
          
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
      ),
    );
  }


  // CONTINENTS SECTION

  Widget buildContinents(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Text(
              'Continents',
              textAlign: TextAlign.left,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ],
          ),
        ),

        const SizedBox(height: 8.0),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            margin: const EdgeInsets.only(top: 0.5),
            child: Row(

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
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Suggestions',
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        Column(
          children: [
            Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 2, bottom: 5),
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
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
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        // shadows: [
                        //   const Shadow(
                        //     offset: Offset(-1.0, -1.0),
                        //     blurRadius: 25.0,
                        //     color: Color(0xFF579BD3), // Highlight
                        //   ),
                        // ],
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      // Background image
                      Positioned.fill(
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          padding:
                              const EdgeInsets.all(20), // Margin for spacing
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(30), // Rounded corners
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/explorearthbackg.png'), // Replace with your image URL
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.05,
                                  vertical: 5),
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
                                          width:
                                              MediaQuery.of(context).size.width,
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
                      ),
                    ],
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
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Destinations',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),

              // Stack(
              //   alignment: Alignment.center,
              //   children: [
              //     // Glowing effect background
              //     Container(
              //       margin: EdgeInsets.only(top: 10,bottom: 10),
              //       height: 40, // Same height as the image or slightly larger
              //       width: MediaQuery.of(context).size.width, // Slightly larger than the image
              //
              //     ),
              //     // The image on top
              //     Container(
              //       child: Image.asset(
              //         "assets/destinationsIMAGES/GIF's/worldlandmarks-Photoroom.png",
              //         height: 40,
              //         width: MediaQuery.of(context).size.width * 0.86,
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),

        // Container(
        //   height: 9, // Thin line
        //   width: double.infinity,
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [
        //         Colors.orange.withOpacity(0.7), // Start of glow
        //         Colors.deepOrangeAccent.withOpacity(0.5), // Fade out
        //         Colors.orange.withOpacity(0.05),
        //       ],
        //       begin: Alignment.bottomCenter,
        //       end: Alignment.topCenter,
        //     ),
        //   ),
        // ),
        // const Divider(
        //   color: Colors.white, // The color of the line
        //   thickness: 0.2, // The thickness of the line
        // ),
        //const SizedBox(height: 8.0),
        Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          height: 145,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (context, index) {
              final destination = destinations[index];

              return Column(
                children: [
                  Stack(
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
                                  builder: (context) =>
                                      const hillStationHOME()),
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
                          //padding: const EdgeInsets.all(5.5),
                          height: 70,
                          width: 70,

                          margin: const EdgeInsets.symmetric(horizontal: 10),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Colors.white,
                              width: 0.5,
                            ),
                            image: DecorationImage(
                              image: destinationGifs[index],
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.3),
                                BlendMode.darken,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    destination,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
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

          decoration: const BoxDecoration(
              color: Colors.transparent,
              // border: Border.all(
              //   color: Colors.white54,
              //   width: 0.1,
              // )
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

// Custom Clipper for Inverted Rounded Bottom Corners
class InvertedRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(
        0, size.height + 50); // Move to bottom left, leaving space for curve
    path.quadraticBezierTo(
      size.width / 2, // Control point X
      size.height + 50, // Control point Y
      size.width, // End point X
      size.height - 50, // End point Y
    );
    path.lineTo(size.width, 0); // Top-right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
