import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project01/Commons/padding.dart';
import 'package:project01/Home/widgets/section_title.dart';
import 'package:text_scroll/text_scroll.dart';

import '../widgets/progress_indicator.dart';

class SuggestionsSection extends StatefulWidget {
  final List<Map<String,String>> images;
  final List<Map<String,String>> details;

  const SuggestionsSection({
    super.key,
    required this.images, required this.details,
  });

  @override
  State<SuggestionsSection> createState() => _SuggestionsSectionState();
}

class _SuggestionsSectionState extends State<SuggestionsSection>
    with SingleTickerProviderStateMixin {


  late final AnimationController _progressController;
  late final PageController _pageController;

  /// Virtual page index: grows forever (0,1,2,3,4,5,6…)
  /// We map it to real images with `% widget.images.length`.
  int _pageIndex = 0;

  bool _isAutoScrolling = false; // 👈 key flag

  @override
  void initState() {
    super.initState();

    if (widget.images.isNotEmpty) {
      // Start in middle of a big range so user can swipe in both directions
      _pageIndex = widget.images.length * 1000;
    } else {
      _pageIndex = 0;
    }

    _pageController = PageController(initialPage: _pageIndex);

    // Pre-cache images
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (final img in widget.images) {
        final imgUrl = img["suggestionsUrl"];
        if (imgUrl != null) {
          precacheImage(NetworkImage(imgUrl), context);
        }
      }
    });

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..forward();

    // When progress reaches 1.0 → go to next story
    _progressController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _handleAutoProgressFinished();
      }
    });
  }

  Future<void> _handleAutoProgressFinished() async {
    if (!mounted || widget.images.isEmpty) return;

    final nextPage = _pageIndex + 1; // always move forward
    _isAutoScrolling = true;

    // Immediately switch the logical page + restart bar
    setState(() => _pageIndex = nextPage);
    _progressController.forward(from: 0);

    // Then animate the PageView – will always scroll in same direction
    await _pageController.animateToPage(
      nextPage,
      duration: const Duration(milliseconds: 1250),
      curve: Curves.easeOutCubic,
    );

    if (!mounted) return;
    _isAutoScrolling = false;
  }



  @override
  void dispose() {
    _progressController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fullWidth = MediaQuery.of(context).size.width;

    if (widget.images.isEmpty) {
      return const SizedBox.shrink();
    }

    // Normalize page index to 0..images.length-1
    final normalizedIndex = _pageIndex % widget.images.length;

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle("Suggestions"),
          SizedBox(height: MediaQuery.sizeOf(context).height*0.025),

          Column(
            children: [

              //AUTO-SCROLL TEXT
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height*0.025,
                  width: fullWidth * 0.9,
                  child: TextScroll(
                    "EXPLORE SOME OF THE BREATHTAKING LANDSCAPES OF ASIA'S MOST ICONIC DESTINATIONS.",
                    intervalSpaces: 3,
                    pauseBetween: const Duration(seconds: 0),
                    velocity: const Velocity(pixelsPerSecond: Offset(40, 0)),
                    fadedBorder: true,
                    fadedBorderWidth: 0.1,
                    fadeBorderSide: FadeBorderSide.both,
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              //AUTO-SCROLL IMAGES
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: double.infinity,
                  height: 175,
                  child: PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    // 🔁 Infinite pages – no itemCount
                    itemBuilder: (_, index) {
                      final realIndex = index % widget.images.length;
                      final imageUrl = widget.images[realIndex]["suggestionsUrl"]!;
                      final imageTitle = widget.images[realIndex]["suggestionsName"];
                      final placeCountry = widget.details[realIndex]["suggestionsCountry"];
                      final placeDescription = widget.details[realIndex]["details"];

                      return Container(
                        width: double.infinity,
                        //padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                              image: NetworkImage(imageUrl),
                            fit: BoxFit.fill
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.7),

                                Colors.transparent,
                                //Colors.deepOrange.shade600.withOpacity(0.3),
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.all(14),
                          alignment: Alignment.bottomLeft,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // TITLE (Like: Timeless Tokyo)
                                Text(
                                  imageTitle!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black87,
                                        blurRadius: 12,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 4),

                                // DETAILS SMALL DESCRIPTION
                                Text(
                                  placeCountry!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.85),
                                    fontSize: 18,
                                    height: 1.25,
                                  ),
                                ),
                                Text(
                                  placeDescription!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.85),
                                    fontSize: 14,
                                    height: 1.25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // child: ClipRRect(
                        //   borderRadius: BorderRadius.circular(12),
                        //   child: Image.network(
                        //     widget.images[realIndex],
                        //     fit: BoxFit.fill,
                        //   ),
                        // ),
                      );
                    },

                    // Fires for both auto-scroll and manual swipe
                    onPageChanged: (index) {
                      setState(() => _pageIndex = index);

                      // Restart bar only when user swipes manually
                      if (!_isAutoScrolling) {
                        _progressController.forward(from: 0);
                      }
                    },
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /// 🔥 Story-style progress indicators (UI same, no lag at end)
              StoryProgressIndicators(
                itemCount: widget.images.length,
                currentIndex: normalizedIndex,
                progress: _progressController,
              ),

              const SizedBox(height: 10),
            ],
          )],
      ),
    );
  }
}
