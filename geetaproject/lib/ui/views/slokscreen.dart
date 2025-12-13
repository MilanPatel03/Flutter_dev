import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geetaproject/providers/geetaProvider.dart';
import 'package:geetaproject/ui/views/widgets/commons.dart';
import 'package:geetaproject/ui/views/widgets/textstyles.dart';
import 'package:provider/provider.dart';
import '../../models/geetaslokmodel.dart';

class Slokscreen extends StatefulWidget {

  final int chapterNumber;
  final int slokNumber;
  const Slokscreen({super.key, required this.chapterNumber, required this.slokNumber});

  @override
  State<Slokscreen> createState() => _SlokscreenState();
}

class _SlokscreenState extends State<Slokscreen> {

  Future<GeetaSlokModel>? _slokFuture;
  bool _isDone = false;

  Future<void> _downloadSlok() async {
    final provider = Provider.of<GeetaProvider>(context, listen: false);

    try {
      await provider.downloadSlok(widget.chapterNumber, widget.slokNumber);
      if (!mounted) return;

      setState(() {
        _isDone = true; // Update icon
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Avoid calling provider logic during build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<GeetaProvider>(context, listen: false);
      setState(() {
        _slokFuture = provider.fetchSlok(widget.chapterNumber, widget.slokNumber);
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    //====PROVIDER====//
    final provider = Provider.of<GeetaProvider>(context);

    return Scaffold(
      //====MAIN-BACKGROUND-COLOR====//
      backgroundColor: const Color(0xFF121212),

      //====APP-BAR====//
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text("अध्याय: ${widget.chapterNumber} श्लोक: ${widget.slokNumber}" , style: TextStyles.darkTheme_mediumFont_H1_hindi,),
        backgroundColor: const Color.fromRGBO(28,28,30, 1),
        iconTheme: const IconThemeData(color: CupertinoColors.white),
      ),

      //====BODY====//
      body: FutureBuilder(
        future: _slokFuture,
        builder: (ctx, snapshot) {
          //----context-based-height----//
          double futureBuilderHeight = MediaQuery.sizeOf(ctx).height;
          double futureBuilderWidth = MediaQuery.sizeOf(ctx).width;

          //----ensure-connection----//
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }

          //----IF-Has-Data----//
          else if (snapshot.hasData) {
            final slok = snapshot.data!;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //----Main-Slok-Sanskrit----//
                  Container(
                    width: futureBuilderWidth,
                    decoration:  const BoxDecoration(
                      //
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(14), bottomRight: Radius.circular(14)),
                      gradient: LinearGradient(colors: [CupertinoColors.black,CupertinoColors.darkBackgroundGray,], begin: Alignment.topCenter,end: Alignment.bottomCenter),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: futureBuilderWidth*0.90,
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.50, color: CupertinoColors.black),
                            image: const DecorationImage(image: AssetImage("assets/images/slokboarddd.jpg"), fit: BoxFit.fill),
                          ),
                          margin: EdgeInsets.symmetric(vertical: futureBuilderHeight*0.015),
                          padding: EdgeInsets.symmetric(horizontal: futureBuilderWidth*0.065,vertical: futureBuilderHeight*0.045),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: futureBuilderWidth*0.03),
                                child: Text(slok.slok ?? "No slok", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: futureBuilderWidth*0.03),
                                child: Text(slok.transliteration ?? "No transliteration", style: const TextStyle(fontSize: 14,fontStyle: FontStyle.italic,color: Colors.white70),),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: futureBuilderWidth*0.065,vertical: futureBuilderHeight*0.045),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: _downloadSlok,
                                icon: Icon(
                                  _isDone? Icons.check_rounded : Icons.arrow_downward_rounded,
                                ),
                                iconSize: 24,
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(_isDone? const Color.fromRGBO(36,36,38, 1): Colors.black),
                                  shape: MaterialStateProperty.all<OutlinedBorder>(
                                    const CircleBorder(
                                      side: BorderSide(color: Colors.white, width: 1.5),
                                    ),
                                  ),
                                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(5)),
                                  iconColor: MaterialStateProperty.all<Color>(Colors.white),
                                ),
                              ),
                              IconButton(onPressed: () async {

                                },
                                icon: const Icon(Icons.bookmark_border_rounded),
                                iconSize: 24,
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                  shape: MaterialStateProperty.all<OutlinedBorder>(
                                    const CircleBorder(
                                      side: BorderSide(color: Colors.white, width: 1.5),
                                    ),
                                  ),
                                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(5)),
                                  iconColor: MaterialStateProperty.all<Color>(Colors.white),
                                ),
                              ),
                              IconButton(onPressed: () async {

                              },
                                icon: const Icon(Icons.favorite_border_rounded),
                                iconSize: 24,
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                  shape: MaterialStateProperty.all<OutlinedBorder>(
                                    const CircleBorder(
                                      side: BorderSide(color: Colors.white, width: 1.5),
                                    ),
                                  ),
                                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(5)),
                                  iconColor: MaterialStateProperty.all<Color>(Colors.white),
                                ),
                              ),
                          ],),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: futureBuilderHeight*0.035),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text("Translations ", style: TextStyles.darkTheme_mediumFont_H2_hindi_white,),
                  ),

                  Commons.customDivider(),

                  //----All-Translations----//
                  ...slok.translations.entries.map((entry) {
                    final key = entry.key;
                    final value = entry.value;

                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Color.fromRGBO(255, 55, 95, 1),
                          Text(value.author ?? "No Auther", style: TextStyles.darkTheme_mediumFont_H3_hindi_white),
                          const SizedBox(height: 10,),
                          if (value.et != null) Column(
                            children: [
                              Text('English Translation: \n ${value.et!}',style: TextStyles.darkTheme_regular_text_hindi),
                            ],
                          ),
                          if (value.ht != null) Column(
                            children: [
                              Text('Hindi Translation: \n ${value.ht!}',style: TextStyles.darkTheme_regular_text_hindi),
                            ],
                          ),
                          if (value.ec != null) Column(
                            children: [
                              Text('English Commentary: \n ${value.ec!}',style: TextStyles.darkTheme_regular_text_hindi),
                            ],
                          ),
                          if (value.hc != null) Column(
                            children: [
                              Text('Hindi Commentary: \n ${value.hc!}',style: TextStyles.darkTheme_regular_text_hindi),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),

                ],
              ),
            );
          }

          //----IF-No-Data----//
          else {
            return const Center(
              child: Text("No Data Found"),
            );
          }
        },
      ),
    );
  }
}
