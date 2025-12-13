import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geetaproject/models/geetachaptermodel.dart';
import 'package:geetaproject/ui/views/slokscreen.dart';
import 'package:geetaproject/ui/views/slokscreenchg.dart';
import 'package:geetaproject/ui/views/widgets/textstyles.dart';
import 'package:provider/provider.dart';

import '../../providers/geetaProvider.dart';

class Chapterscreen extends StatefulWidget {
  final int chapterNumber;
  const Chapterscreen({super.key, required this.chapterNumber});

  @override
  State<Chapterscreen> createState() => _ChapterscreenState();
}

class _ChapterscreenState extends State<Chapterscreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GeetaProvider>(context);
    final thisChapter = provider.chapters.firstWhere(
      (element) => element.chapterNumber == widget.chapterNumber,
      orElse: () => GeetaChapterModel(),
    );
    final totalSloks = thisChapter.versesCount ?? 0;

    //Context-Based-Height and Width
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    if (thisChapter.chapterNumber == null) {
      return const Scaffold(
        body: Center(
          child: Text("No Chapters Found"),
        ),
      );
    }
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: Text(
          "अध्याय: ${thisChapter.chapterNumber}",
          style: TextStyles.darkTheme_mediumFont_H1_hindi,
        ),
        backgroundColor: const Color.fromRGBO(28, 28, 30, 1),
        iconTheme: const IconThemeData(color: CupertinoColors.white),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: w*0.050),
        padding: EdgeInsets.symmetric(horizontal: h*0.025),
        child: GridView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: totalSloks,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 22,
              mainAxisSpacing: 22,
              mainAxisExtent: 70,
            ),
            itemBuilder: (context, index) {
              double chHeight = MediaQuery.sizeOf(context).height;
              double chWidth = MediaQuery.sizeOf(context).width;
              final slokNumber = index + 1;
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Slokscreenchg(
                                chapterNumber: thisChapter.chapterNumber!,
                                slokNumber: slokNumber,
                              )));
                },
                child: Container(
                  margin: const EdgeInsets.all(0.5),
                  height: chHeight * 0.18,
                  width: chHeight * 0.18,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.50,color: const Color.fromRGBO(13, 27, 42, 1)),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                    child: Text(
                      "$slokNumber",
                      style: TextStyles.darkTheme_mediumFont_H3_hindi_white,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
