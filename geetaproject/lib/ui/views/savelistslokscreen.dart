import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geetaproject/ui/views/slokscreen.dart';
import 'package:geetaproject/ui/views/widgets/textstyles.dart';
import 'package:provider/provider.dart';

import '../../models/geetaslokmodel.dart';
import '../../models/savelistmodel.dart';
import '../../providers/geetaProvider.dart';

class SavelistSloksScreen extends StatelessWidget {
  final String savelistName;

  const SavelistSloksScreen({super.key, required this.savelistName});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GeetaProvider>(context);

    // Find the savelist from provider's savelistModels
    final savelist = provider.savelistModels.firstWhere(
          (savelist) => savelist.name == savelistName,
      orElse: () => SavelistModel(name: savelistName, sloks: []),
    );
    final sloks = savelist.sloks;

    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          savelistName,
          style: TextStyles.darkTheme_mediumFont_H1_hindi,
        ),
        backgroundColor: const Color.fromRGBO(28, 28, 30, 1),
      ),
      body: sloks.isEmpty
          ? const Center(
        child: Text(
          "इस सेवलिस्ट में कोई श्लोक नहीं हैं।",
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.symmetric(vertical: h * 0.02),
        itemCount: sloks.length,
        itemBuilder: (context, index) {
          final slok = sloks[index];
          return FutureBuilder<GeetaSlokModel>(
            future: provider.fetchSlok(
                slok['chapter'] as int, slok['slok'] as int),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text("Error loading slok"));
              } else if (snapshot.hasData) {
                final slokData = snapshot.data!;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Slokscreen(
                          chapterNumber: slok['chapter'] as int,
                          slokNumber: slok['slok'] as int,
                        ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "अध्याय ${slok['chapter']}, श्लोक ${slok['slok']}",
                          style: TextStyles
                              .darkTheme_mediumFont_H2_hindi_white70,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          slokData.slok ?? "No slok text",
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}