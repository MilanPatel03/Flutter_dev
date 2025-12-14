import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project01/Home/sections/continent_section.dart';
import '../../Commons/constants.dart';
import '../sections/suggestions_section.dart';
import '../sections/destinations_section.dart';
import '../sections/news_section.dart';
import '../sections/videos_section.dart';
import '../widgets/comet_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {


  // 🔥 Comet animation fields
  late final AnimationController _meteorController;
  late final Animation<Offset> _meteorOffset;


  // initState and dispose
  @override
  void initState() {
    super.initState();

    // Single-controller approach (don't call repeat() and then forward in a loop)
    _meteorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    // _meteorController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 2), // how fast the comet crosses
    // )..repeat(
    //   reverse: false, // always goes one way, then jumps back
    // );

    _meteorOffset = Tween<Offset>(
      // These are *fractional* offsets relative to the comet's size
      // Start slightly outside top-right
      begin: const Offset(-6.5, 5.8),
      // End slightly outside bottom-left
      end: const Offset(2.5, -2.2),
    ).animate(
      CurvedAnimation(
        parent: _meteorController,
        curve: Curves.easeInOut,
      ),
    );


    _startMeteorLoop();
  }

  // Function to handle comet animation with 10s pause
  void _startMeteorLoop() async {
    while (mounted) {
      await _meteorController.forward(from: 0.0); // run animation once
      await Future.delayed(const Duration(seconds: 10)); // wait 10s before next
    }
  }

  @override
  void dispose() {
    _meteorController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181818),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ------------------ TOP FANCY APP BAR ------------------
            _buildCustomAppBar(context),

            // ------------------ PINNED SEARCH BAR ------------------
            _buildPinnedSearchBar(),

            // ------------------ SECTIONS ------------------


            //-----CONTINENTS-----//
            const SliverToBoxAdapter(child: SizedBox(height: 5)),
            const SliverToBoxAdapter(child: ContinentsSectionDummy()),

            //-----SUGGESTIONS-----//
            const SliverToBoxAdapter(child: SizedBox(height: 5)),
            SliverToBoxAdapter(
              child: SuggestionsSection(images: suggestionImages, details: suggestionsDetails, ),
            ),

            //-----DESTINATIONS-----//
            const SliverToBoxAdapter(child: SizedBox(height: 5)),
            SliverToBoxAdapter(
              child: DestinationsSection(destinations: destinations),
            ),

            //-----NEWS-----//
            const SliverToBoxAdapter(child: SizedBox(height: 5)),
            SliverToBoxAdapter(
              child: NewsSection(websiteIcons: newsSites,),
            ),

            //-----VIDEOS-----//
            const SliverToBoxAdapter(child: SizedBox(height: 5)),
            const SliverToBoxAdapter(child: VideosSection()),

            const SliverToBoxAdapter(child: SizedBox(height: 50)),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildCustomAppBar(BuildContext context) {

    final screen = MediaQuery.of(context).size;
    final sunSize = screen.width * 0.22;


    return SliverAppBar(
      floating: true,
      pinned: false,
      snap: false,
      expandedHeight: MediaQuery.of(context).size.height * 0.14,
      toolbarHeight: MediaQuery.of(context).size.height * 0.07,
      backgroundColor: Colors.black,
      flexibleSpace: Stack(
        children: [
          FlexibleSpaceBar(
            background: ClipRRect(
              child: ClipPath(
                child: Stack(
                  children: [
                    // REALISTIC SUN — replaces your old simple gradient
                    // --------------------------------------------------------------
                    // 🌞 THE SUN (SVG FIXED)
                    // --------------------------------------------------------------
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(left: sunSize * 2.5, bottom: sunSize * 0.5),
                        child: SvgPicture.asset(
                          "assets/sunclean.svg",
                          width: sunSize,   // perfect size for your layout
                          height: sunSize,
                          fit: BoxFit.contain,

                          placeholderBuilder: (_) => const SizedBox(
                            width: 40,
                            height: 40,
                            child: CircularProgressIndicator(color: Colors.orange),
                          ),
                        ),
                      ),
                    ),


                    // Your Earth globe (unchanged)
                    // --------------------------------------------------------------
                    // 🌍 EARTH — always right of the sun & responsive
                    // --------------------------------------------------------------
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: screen.width * 0.015,
                          left: screen.width * 0.30,   // pushes earth to the RIGHT
                        ),
                        child: Image.asset(
                          'assets/destinationsIMAGES/earthtop.webp',

                          // ⭐ Earth bigger than the sun
                          width: screen.width * 0.34,   // sun was 0.28 → earth = +20% larger
                          height: screen.width * 0.34,

                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),

          // 🌠 COMET / METEOR PASSING
          Align(
            alignment: Alignment.topRight,
            child: SlideTransition(
              position: _meteorOffset,
              child: const Comet(),
            ),
          ),

          // Title overlay (unchanged — looks even better now with real sun behind)
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xff181818),
                  const Color(0xff181818).withOpacity(0.15),
                  const Color(0xff181818),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: const Text(
              "Explorearth",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                letterSpacing: 0.9,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(color: Colors.black87, blurRadius: 12, offset: Offset(0, 2)),
                  Shadow(color: Colors.black54, blurRadius: 24, offset: Offset(0, 4)),
                ],
              ),
            ),
          ),

          // Optional: subtle bottom fade (uncomment if you want)
          // Positioned(
          //   bottom: 0, left: 0, right: 0,
          //   child: Container(
          //     height: 30,
          //     decoration: const BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.bottomCenter,
          //         end: Alignment.topCenter,
          //         colors: [Color(0xff181818), Colors.transparent],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  /**
      SliverAppBar(
      floating: true,
      pinned: false,
      snap: false,
      expandedHeight: MediaQuery.of(context).size.height * 0.14,
      toolbarHeight: MediaQuery.of(context).size.height * 0.07,
      backgroundColor: const Color(0xff181818),
      flexibleSpace: Stack(

      children: [
      FlexibleSpaceBar(
      background: ClipRRect(
      child: ClipPath(
      child: Stack(
      children: [
      Container(
      height: MediaQuery.of(context).size.height * 0.55,
      width: MediaQuery.of(context).size.width * 0.45,
      margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.width * 0.025,
      left: MediaQuery.of(context).size.width * 0.275,
      ),
      decoration: const BoxDecoration(
      gradient: RadialGradient(
      colors: [
      Color(0xffd65050),
      Color(0xffffa700),
      Colors.transparent,
      ],
      center: Alignment.center,
      radius: 0.35,

      ),
      ),
      ),
      Container(
      height: 115,
      width: 115,
      margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.width * 0.015,
      left: MediaQuery.of(context).size.width * 0.510,
      ),
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

      Container(
      //padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
      gradient: LinearGradient(
      colors: [
      const Color(0xff181818), // lighter overlay so background is visible
      const Color(0xff181818).withOpacity(0.15), // lighter overlay so background is visible
      const Color(0xff181818), // lighter overlay so background is visible
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      ),
      ),

      child: Text(
      "Explorearth",
      style: TextStyle(
      color: Colors.white,
      fontSize: 30,
      letterSpacing: 0.9,
      fontWeight: FontWeight.w600,

      // 🖤 Semi-transparent black glow behind text
      shadows: [
      Shadow(
      color: Colors.black.withOpacity(0.8),
      blurRadius: 12,
      offset: const Offset(0, 2),
      ),
      Shadow(
      color: Colors.black.withOpacity(0.6),
      blurRadius: 24,
      offset: const Offset(0, 4),
      ),
      ],
      ),
      ),

      ),

      // ADD THIS FADE


      // Positioned(
      //   bottom: 0,
      //   left: 0,
      //   right: 0,
      //   child: Container(
      //     height: MediaQuery.of(context).size.height * 0.03,
      //     decoration: const BoxDecoration(
      //       gradient: LinearGradient(
      //         begin: Alignment.bottomCenter,
      //         end: Alignment.topCenter,
      //         colors: [
      //           Color(0xff181818),
      //           Color(0xff18181800),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      ],
      ),
      );
   **/



  // ------------------------------------------------------------------------
  // 2. PINNED SEARCH BAR (always visible)
  // ------------------------------------------------------------------------
  SliverAppBar _buildPinnedSearchBar() {
    return SliverAppBar(
      pinned: true,
      floating: false,
      backgroundColor: const Color(0xff181818),
      automaticallyImplyLeading: false,
      toolbarHeight: 62,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Container(
          height: 38,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
          decoration: BoxDecoration(
            color: const Color(0xff1f1f1f),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.08), width: 1),
            boxShadow: [
              // BoxShadow(
              //   color: Colors.black.withOpacity(0.5),
              //   blurRadius: 8,
              //   offset: const Offset(0, 3),
              // ),
              // BoxShadow(
              //   color: Colors.black.withOpacity(0.06),
              //   blurRadius: 16,
              //   spreadRadius: 1,
              // ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.search, color: Colors.white70, size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(

                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: "Search destinations, news...",
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.55),
                      fontSize: 15,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Icon(Icons.mic_none,
                  color: Colors.white.withOpacity(0.65), size: 22),
            ],
          ),
        ),
      ),
      flexibleSpace: ClipRRect(
        child: Stack(
          //ADD THIS FADE


          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: const BoxDecoration(
                  //border: Border.all(color: Colors.black),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xAA000000), // 66% black
                      Color(0x00000000), // transparent
                      //Color(0xff181818),
                      Color(0xff18181800),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
