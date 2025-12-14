import 'package:flutter/material.dart';
import 'package:project01/DestinationHomes/heritageHome/GroupScreenOfHeritage.dart';
import 'package:project01/DestinationHomes/heritageHome/NewsScreenOfHeritage.dart';
import 'package:project01/DestinationHomes/heritageHome/PlacesScreenOfHeritage.dart';

class heritageHOME extends StatefulWidget {
  const heritageHOME({super.key});

  @override
  State<heritageHOME> createState() => _heritageHOMEState();
}

class _heritageHOMEState extends State<heritageHOME> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tab(text: 'Places',),
              Tab(text: 'News',),
              Tab(text: 'Groups',),
            ]
            ),
          ),
          body: const TabBarView(
            children: [
              placesScreenOfHeritage(),
              newsScreenOfHeritage(),
              groupScreenOfHeritage(),
            ],
          ),
        )
    );
  }
}
