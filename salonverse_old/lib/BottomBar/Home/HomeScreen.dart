import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {


  Color appbarTextColor = Colors.white;
  Color brownColorOfAppBar = const Color(0xFFAF7F1F).withOpacity(0.9);
  Color brownColorApp = const Color(0xFFAF7F1F);
  Color screenColor = const Color(0xFFFFFFFF);
  String locationOfUser = "Ahmedabad";

  final List<Color> _cardColors = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
  ];

  final List<AssetImage> nearBySalons = [
    const AssetImage("assets/SalonAppAssets/homepageCard02.jpg"),
    const AssetImage("assets/SalonAppAssets/homepageCard06.jpg"),
    const AssetImage("assets/SalonAppAssets/homepageCard04.jpg"),
  ];

  final List<AssetImage> cardOfHomePageImages = [
    const AssetImage("assets/SalonAppAssets/homepageCard01.jpg"),
    const AssetImage("assets/SalonAppAssets/homepageCard02.jpg"),
    const AssetImage("assets/SalonAppAssets/homepageCard05.jpg"),
  ];

  late PageController _pageController;
  late Timer _timer;

  int _currentPage = 0;

  final List<String> nearbySalonNames = [
    'Black Hair & Beauty Salon',
    'Herik Unisex Salon',
    'Enrich Unisex Beauty & Care',
  ];
  final List<String> nearbySalonLocations = [
    'Nikol, Ahmedabad',
    'Naroda, Ahmedabad',
    'Chandkheda, Ahmedabad',
  ];
  final List<String> nearbySalonDistance = [
    '1.2 KM',
    '3.9 KM',
    '3.0 KM',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < _cardColors.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 1300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  Color borderColorOfMenContainer = Colors.black38;
  Color borderColorOfWomenContainer = Colors.black38;

  bool isChecked01 = false;
  bool isChecked02 = false;

  bool isMenSelected = false;
  bool isWomenSelected = false;

  void _toggleCheckMark01() {
    setState(() {
      isChecked01 = true;
      isChecked02 = false;
      isMenSelected = true;
      isWomenSelected = false;
    });
  }
  void _toggleCheckMark02() {
    setState(() {
      isChecked02 = true;
      isChecked01 = false;
      isWomenSelected = true;
      isMenSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: screenColor,
      drawer: Container(
        //width: 300, // Set the width of the drawer
        margin: const EdgeInsets.only(top: 25, bottom: 25), // Add margin around the drawer
        child: Drawer(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 10),
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
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
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(

        slivers: [
          SliverAppBar(
            stretch: true,
            centerTitle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
            ),
            iconTheme: IconThemeData(
              color: appbarTextColor,
            ),
            floating: false,
            pinned: false,
            snap: false,
            expandedHeight: 120.0,
            backgroundColor: brownColorOfAppBar,

            leading: Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 10.0, bottom: 5.0), // Adjust this value for horizontal positioning
              child: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  }
              ),
            ),


            flexibleSpace: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: FlexibleSpaceBar(
                background: Container(
                  color: brownColorOfAppBar,
                ),
                title: Container(
                  width: 135,
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin: const EdgeInsets.only(top: 45, left: 0),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 15,
                        color: appbarTextColor,
                      ),
                      Text(
                        locationOfUser,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          color: appbarTextColor,
                          fontSize: 12,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              Stack(
                children: [
                  IconButton(
                    icon: Icon(
                      color: appbarTextColor,
                      Icons.notifications,
                      size: 25.0, // Change the icon size
                    ),
                    onPressed: () {
                      // Handle notification icon tap
                    },
                  ),
                  Positioned(
                    right: 11,
                    top: 11,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: Text(
                        '1', // Badge text
                        style: TextStyle(
                          color: appbarTextColor,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Column(
                  children: [
                    if (index == 0) const SizedBox(height: 8.0),
                    if (index == 0) buildCardsSuggestions(context),
                    if (index == 0) const SizedBox(height: 8.0),
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCardsSuggestions(BuildContext context) {


    final size = Size.square(MediaQuery.of(context).size.shortestSide);
    final primarySize = size.shortestSide/20;

    return Column(

      children: [

        //Search Bar
        Padding(
          padding: EdgeInsets.symmetric(horizontal: primarySize, vertical: primarySize),
          child: TextField(

            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: brownColorApp, // Border color when not focused
                  width: 0.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Colors.black, // Border color when focused
                  width: 0.5,
                ),
              ),


              hintText: "Search Services..",
              prefixIcon: const Icon(Icons.search),
              hintStyle: TextStyle(
                color: Colors.grey[500],
                fontWeight: FontWeight.w300,
              ),

            ),
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
          ),
        ),
        //AutoCardSwipe
        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 10),
          child: SizedBox(
            height: 200,
            child: Stack(
              children: [
                PageView.builder(
                    controller: _pageController,
                    itemCount: _cardColors.length,
                    itemBuilder: (context, index) {
                      return _buildCard(index);
                    }),

                Positioned(
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 210),
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
                        effect: ExpandingDotsEffect(
                          spacing: 6.0,
                          radius: 12.0,
                          dotHeight: 6,
                          dotWidth: 6,
                          paintStyle: PaintingStyle.fill,
                          strokeWidth: 2.5,
                          activeDotColor: brownColorApp,
                          dotColor: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 8.0),

        Container(
          height: 335,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              //SERVICE CATEGORY TEXT
              Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: primarySize),
                padding: EdgeInsets.symmetric(horizontal: primarySize),
                decoration: const BoxDecoration(
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(image: AssetImage("assets/SalonAppAssets/IconsHomeScreen/scissors.png")),
                    Text(
                      "Service Category",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.kavoon(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Image(image: AssetImage("assets/SalonAppAssets/IconsHomeScreen/straightner.png")),
                  ],
                ),

              ),

              //2 CONTAINERS
              Container(
                padding: EdgeInsets.symmetric(vertical: primarySize),
                decoration: const BoxDecoration(
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: _toggleCheckMark01,

                      child: Column(

                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 150,
                                width: 140,
                                margin: const EdgeInsets.only(left: 25),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 0.5,
                                    color: isChecked01 ? brownColorApp : borderColorOfMenContainer,
                                  ),

                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: SvgPicture.asset("assets/SalonAppAssets/IconsHomeScreen/menCareSvg.svg",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  width: 21,
                                  height: 21,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: brownColorApp,
                                    border: Border.all(color: Colors.transparent),
                                  ),
                                  child: isChecked01
                                      ? Padding(
                                    padding: const EdgeInsets.all(3.5),
                                    child: SvgPicture.asset(
                                      'assets/SalonAppAssets/IconsHomeScreen/checkmarkSvg1.svg', // Checkmark image
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
                            margin: const EdgeInsets.only(left: 25),
                            child: Center(
                              child: Text(
                                "Men's",
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
                    ),
                    GestureDetector(
                      onTap: _toggleCheckMark02,
                      child: Column(

                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 150,
                                width: 140,
                                margin: const EdgeInsets.only(right: 25),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 0.5,
                                    color: isChecked02 ? brownColorApp : borderColorOfMenContainer,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: SvgPicture.asset("assets/SalonAppAssets/IconsHomeScreen/womencareSvg.svg",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 33,
                                child: Container(
                                  width: 21,
                                  height: 21,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: brownColorApp,
                                    border: Border.all(color: Colors.transparent),
                                  ),
                                  child: isChecked02
                                      ? Padding(
                                    padding: const EdgeInsets.all(3.5),
                                    child: SvgPicture.asset(
                                      'assets/SalonAppAssets/IconsHomeScreen/checkmarkSvg1.svg', // Checkmark image
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
                            margin: const EdgeInsets.only(right: 25),
                            child: Center(
                              child: Text(
                                "Women's",
                                style: GoogleFonts.kavoon(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),

        Container(
          height: 400,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //SEE ALL
              Center(
                child: GestureDetector(
                  onTap: (){
                    if(isMenSelected){
                      //Get.to(() => const Mensservicecategories());
                    } else if(isWomenSelected){
                      //Get.to(() => const Womenservicecategories());
                    }
                  },
                  child: Container(
                    height: 30,
                    width: 120,
                    margin: EdgeInsets.symmetric(vertical: primarySize),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 0.5,
                        color: brownColorApp,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "See All >>",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mulish(
                          color: brownColorApp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Column(

                children: [
                  Container(
                    decoration: const BoxDecoration(

                    ),
                    margin: EdgeInsets.only(top: primarySize,left: primarySize,right: primarySize),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          "Near by salon",
                          style: GoogleFonts.kavoon(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){

                          },
                          child: Text(
                            "See All >>",
                            style: GoogleFonts.mulish(
                              color: brownColorApp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  Column(
                    children: [
                      SizedBox(
                        height: 256,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: nearbySalonNames.length,
                            itemBuilder: (context, index) {
                              return Center(
                                child: Stack(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (index == 0) {

                                        } else if (index == 1) {

                                        } else if (index == 2) {


                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const homepage()),
                                          );
                                        }
                                      },
                                      child: Card(
                                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        elevation: 6,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 290,
                                              height: 190,
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                                                border: Border.all(
                                                  width: 0.5,
                                                  color: Colors.black,
                                                ),
                                                image: DecorationImage(
                                                  image: nearBySalons[index],
                                                  fit: BoxFit.fill,
                                                  colorFilter: ColorFilter.mode(
                                                      Colors.white.withOpacity(0.9),
                                                      BlendMode.darken
                                                  ),
                                                ),
                                              ),

                                            ),
                                            Container(
                                              height: 45,
                                              width: 290,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  bottomRight: Radius.circular(15),
                                                  bottomLeft: Radius.circular(15),
                                                ),
                                                border: Border.symmetric(
                                                  horizontal:  BorderSide(
                                                    color: Colors.black,
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          nearbySalonNames[index],
                                                          style: GoogleFonts.mulish(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.normal,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        Text(
                                                          nearbySalonLocations[index],
                                                          textAlign: TextAlign.start,
                                                          style: GoogleFonts.mulish(
                                                            fontSize: 10,
                                                            color: Colors.black45,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),


      ],
    );
  }

  Widget _buildCard(int index) {

    final size = Size.square(MediaQuery.of(context).size.shortestSide);
    final primarySize = size.shortestSide/20;

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: _cardColors[index],
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
              ),
            ],
            image: DecorationImage(
              image: cardOfHomePageImages[index],
              fit: BoxFit.cover,
              colorFilter:
              const ColorFilter.mode(
                  Colors.black45,
                  BlendMode.darken
              ),
            ),
          ),
        ),
        Positioned(
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.black,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 90,
                      blurStyle: BlurStyle.inner,
                    )
                  ]),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      "50%",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mulish(
                        color: brownColorApp,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "off",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.kavoon(
                      color: brownColorApp,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,

                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}