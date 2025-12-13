import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geetaproject/providers/geetaProvider.dart';
import 'package:geetaproject/ui/views/chapterscreen.dart';
import 'package:geetaproject/ui/views/offline/offlineslokscreen.dart';
import 'package:geetaproject/ui/views/savelistscreen.dart';
import 'package:geetaproject/ui/views/widgets/textstyles.dart';
import 'package:provider/provider.dart';

class Homepagechg extends StatefulWidget {
  const Homepagechg({super.key});

  @override
  State<Homepagechg> createState() => _HomepagechgState();
}

class _HomepagechgState extends State<Homepagechg> {
  int _selectedIndex = 0;

  // List of screens for navigation
  final List<Widget> _screens = [
    const HomeContent(), // Existing home content
    const SavelistScreen(), // New savelist screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(28, 28, 30, 1),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Saved',
            ),
          ],
        ),
      ),
    );
  }
}

// Extracted home content as a separate widget
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GeetaProvider>(context);
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          "श्रीमद्भगवद्गीता",
          style: TextStyles.darkTheme_mediumFont_H1_hindi,
        ),
        backgroundColor: const Color.fromRGBO(28, 28, 30, 1),
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.chapters.isEmpty
          ? const Center(child: Text("No Chapters Found"))
          : SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const Offlineslokscreen()),
                    );
                  },
                  icon: const Icon(Icons.save),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: provider.chapters.length,
              itemBuilder: (context, index) {
                final chapter = provider.chapters[index];
                double chHeight = MediaQuery.sizeOf(context).height;
                double chWidth = MediaQuery.sizeOf(context).width;
                return GestureDetector(
                  onTap: () {
                    if (chapter.chapterNumber != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Chapterscreen(
                              chapterNumber: chapter.chapterNumber!),
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: w * 0.055,
                        right: w * 0.055,
                        top: h * 0.025),
                    decoration: BoxDecoration(
                      color: CupertinoColors.darkBackgroundGray,
                      gradient: const SweepGradient(
                        colors: [
                          CupertinoColors.label,
                          CupertinoColors.darkBackgroundGray,
                          CupertinoColors.label,
                        ],
                        center: Alignment.bottomLeft,
                        startAngle: 0.0,
                        endAngle: 7.14,
                      ),
                      border: Border.all(
                          color: Colors.white70, width: 0.50),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    height: h * 0.13,
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: chWidth * 0.10),
                        Text(
                          "अध्याय: ${chapter.chapterNumber}",
                          style: TextStyles
                              .darkTheme_mediumFont_H2_hindi_white70,
                        ),
                        SizedBox(width: chWidth * 0.25),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                chapter.name?.toString() ?? "Error",
                                style: TextStyles
                                    .darkTheme_mediumFont_H3_hindi_white70,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "श्लोक: ${chapter.versesCount}",
                                style: TextStyles
                                    .darkTheme_mediumFont_H3_hindi_white70,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}