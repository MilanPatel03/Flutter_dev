import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geetaproject/providers/geetaProvider.dart';
import 'package:geetaproject/ui/views/savelistslokscreen.dart';
import 'package:geetaproject/ui/views/widgets/textstyles.dart';
import 'package:provider/provider.dart';

class SavelistScreen extends StatelessWidget {
  const SavelistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GeetaProvider>(context);
    final savelists = provider.savelists;
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          "सेवलिस्ट",
          style: TextStyles.darkTheme_mediumFont_H1_hindi,
        ),
        backgroundColor: const Color.fromRGBO(28, 28, 30, 1),
      ),
      body: savelists.isEmpty
          ? const Center(
        child: Text(
          "कोई सेवलिस्ट नहीं मिली। श्लोक स्क्रीन से एक बनाएं।",
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.symmetric(vertical: h * 0.02),
        itemCount: savelists.length,
        itemBuilder: (context, index) {
          final savelist = savelists[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      SavelistSloksScreen(savelistName: savelist),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: w * 0.055, vertical: h * 0.01),
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.04, vertical: h * 0.02),
              decoration: BoxDecoration(
                color: CupertinoColors.darkBackgroundGray,
                border: Border.all(color: Colors.white70, width: 0.5),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    savelist,
                    style:
                    TextStyles.darkTheme_mediumFont_H2_hindi_white70,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white70,
                    size: 16,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}