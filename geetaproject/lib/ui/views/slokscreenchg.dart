import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geetaproject/providers/geetaProvider.dart';
import 'package:geetaproject/ui/views/widgets/commons.dart';
import 'package:geetaproject/ui/views/widgets/iconbutton.dart';
import 'package:geetaproject/ui/views/widgets/slokboardcontainer.dart';
import 'package:geetaproject/ui/views/widgets/textstyles.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../../models/geetaslokmodel.dart';

class Slokscreenchg extends StatefulWidget {
  final int chapterNumber;
  final int slokNumber;
  const Slokscreenchg({super.key, required this.chapterNumber, required this.slokNumber});

  @override
  State<Slokscreenchg> createState() => _SlokscreenchgState();
}

class _SlokscreenchgState extends State<Slokscreenchg> {
  Future<GeetaSlokModel>? _slokFuture;
  bool _isDownloadDone = false;
  bool _isSaveDone = false;
  bool _isLiked = false;

  Future<void> _downloadSlok() async {
    final provider = Provider.of<GeetaProvider>(context, listen: false);
    try {
      await provider.downloadSlok(widget.chapterNumber, widget.slokNumber);
      if (!mounted) return;
      setState(() {
        _isDownloadDone = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Slok downloaded for offline use!')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error downloading slok: $e')),
      );
    }
  }

  Future<void> _showCreateSavelistDialog() async {
    final TextEditingController _savelistNameController = TextEditingController();
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Create Savelist'),
          content: TextField(
            controller: _savelistNameController,
            decoration: const InputDecoration(hintText: 'Enter savelist name'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final name = _savelistNameController.text.trim();
                if (name.isNotEmpty) {
                  try {
                    final provider = Provider.of<GeetaProvider>(context, listen: false);
                    await provider.createSavelist(name);
                    if (!mounted) return;
                    Navigator.pop(context);
                    _isSaveDone = true;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Savelist "$name" created!')),
                    );
                  } catch (e) {
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: $e')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a valid name')),
                  );
                }
              },
              child: const Text('Create'),
            ),
          ],
        );
      },
    );
  }

  void _handleSaveMenuSelection(String value) async {
    final provider = Provider.of<GeetaProvider>(context, listen: false);
    try {
      if (value == 'create_savelist') {
        await _showCreateSavelistDialog();
      } else {
        await provider.addSlokToSavelist(value, widget.chapterNumber, widget.slokNumber);
        if (!mounted) return;
        _isSaveDone = true;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Slok added to "$value"!')),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<GeetaProvider>(context, listen: false);
      setState(() {
        _slokFuture = provider.fetchSlok(widget.chapterNumber, widget.slokNumber);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GeetaProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "अध्याय: ${widget.chapterNumber} श्लोक: ${widget.slokNumber}",
          style: TextStyles.darkTheme_mediumFont_H1_hindi,
        ),
        backgroundColor: const Color.fromRGBO(28, 28, 30, 1),
        iconTheme: const IconThemeData(color: CupertinoColors.white),
      ),
      body: FutureBuilder(
        future: _slokFuture,
        builder: (ctx, snapshot) {
          double futureBuilderHeight = MediaQuery.sizeOf(ctx).height;
          double futureBuilderWidth = MediaQuery.sizeOf(ctx).width;

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final slok = snapshot.data!;

            return SingleChildScrollView(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    width: futureBuilderWidth,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(14),
                          bottomRight: Radius.circular(14)),
                      gradient: LinearGradient(
                          colors: [CupertinoColors.black, CupertinoColors.darkBackgroundGray],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Container(
                        //   width: futureBuilderWidth * 0.90,
                        //   decoration: BoxDecoration(
                        //     border: Border.all(width: 0.50, color: CupertinoColors.black),
                        //     image: const DecorationImage(
                        //         image: AssetImage("assets/images/slokboarddd.jpg"),
                        //         fit: BoxFit.fill),
                        //   ),
                        //   margin: EdgeInsets.symmetric(vertical: futureBuilderHeight * 0.015),
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: futureBuilderWidth * 0.065,
                        //       vertical: futureBuilderHeight * 0.045),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       Padding(
                        //         padding: EdgeInsets.symmetric(
                        //             horizontal: futureBuilderWidth * 0.03),
                        //         child: Text(
                        //           slok.slok ?? "No slok",
                        //           style: const TextStyle(
                        //               fontSize: 16,
                        //               fontWeight: FontWeight.bold,
                        //               color: Colors.white),
                        //         ),
                        //       ),
                        //       const SizedBox(height: 10),
                        //       Padding(
                        //         padding: EdgeInsets.symmetric(
                        //             horizontal: futureBuilderWidth * 0.03),
                        //         child: Text(
                        //           slok.transliteration ?? "No transliteration",
                        //           style: const TextStyle(
                        //               fontSize: 14,
                        //               fontStyle: FontStyle.italic,
                        //               color: Colors.white70),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        SlokboardContainer(width: futureBuilderWidth, height: futureBuilderHeight, slok: slok.slok ?? "No Slok", transliteration: slok.transliteration ?? "No Transliteration"),

                        //3-IconButtons
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: futureBuilderWidth * 0.065, vertical: futureBuilderHeight * 0.045),

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              CustomIconButton(icon: Icon(_isDownloadDone? Icons.check_rounded : Icons.arrow_downward_rounded), boolValue: _isDownloadDone, onPressed: _downloadSlok,),

                              PopupMenuButton<String>(
                                icon: Icon(_isSaveDone? Icons.bookmark_added_rounded: Icons.bookmark_border_rounded),
                                iconSize: 24,
                                color: Colors.black,
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      _isSaveDone
                                          ? const Color.fromRGBO(36, 36, 38, 1)
                                          : Colors.black),
                                  shape: MaterialStateProperty.all<OutlinedBorder>(
                                    const CircleBorder(
                                        side: BorderSide(color: Colors.white, width: 1.5)),
                                  ),
                                  padding:
                                  MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(5)),
                                  iconColor: MaterialStateProperty.all<Color>(Colors.white),
                                ),
                                shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.white, width: 1.5),
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                ),
                                onSelected: _handleSaveMenuSelection,
                                itemBuilder: (context) {
                                  // Get savelists from provider
                                  final savelists = provider.savelists;
                                  return [
                                    // Always show "Create Savelist" option
                                    const PopupMenuItem<String>(
                                      value: 'create_savelist',
                                      child: Text(
                                        'Create Savelist',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    // Show existing savelists
                                    ...savelists.map((savelist) => PopupMenuItem<String>(
                                      value: savelist,
                                      child: Text(
                                        savelist,
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    )),
                                  ];
                                },
                              ),

                              CustomIconButton(icon: const Icon(Icons.favorite_border_rounded), onPressed: (){}, boolValue: _isLiked)

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: futureBuilderHeight * 0.035),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "Translations ",
                      style: TextStyles.darkTheme_mediumFont_H2_hindi_white,
                    ),
                  ),

                  Commons.customDivider(),

                  ...slok.translations.entries.map((entry) {
                    final key = entry.key;
                    final value = entry.value;
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            value.author ?? "No Author",
                            style: TextStyles.darkTheme_mediumFont_H3_hindi_white,
                          ),
                          const SizedBox(height: 10),
                          if (value.et != null)
                            Column(
                              children: [
                                Text(
                                  'English Translation: \n ${value.et!}',
                                  style: TextStyles.darkTheme_regular_text_hindi,
                                ),
                              ],
                            ),
                          if (value.ht != null)
                            Column(
                              children: [
                                Text(
                                  'Hindi Translation: \n ${value.ht!}',
                                  style: TextStyles.darkTheme_regular_text_hindi,
                                ),
                              ],
                            ),
                          if (value.ec != null)
                            Column(
                              children: [
                                Text(
                                  'English Commentary: \n ${value.ec!}',
                                  style: TextStyles.darkTheme_regular_text_hindi,
                                ),
                              ],
                            ),
                          if (value.hc != null)
                            Column(
                              children: [
                                Text(
                                  'Hindi Commentary: \n ${value.hc!}',
                                  style: TextStyles.darkTheme_regular_text_hindi,
                                ),
                              ],
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            );
          } else {
            return const Center(child: Text("No Data Found"));
          }
        },
      ),
    );
  }
}