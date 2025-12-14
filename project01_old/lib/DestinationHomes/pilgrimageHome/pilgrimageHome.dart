import 'package:flutter/material.dart';
import 'package:project01/DestinationHomes/pilgrimageHome/GroupsScreenOfPilgrimage.dart';
import 'package:project01/DestinationHomes/pilgrimageHome/NewsScreenOfPilgrimage.dart';
import 'package:project01/DestinationHomes/pilgrimageHome/PlacesScreenOfPilgrimage.dart';

class pilgrimageHOME extends StatefulWidget {
  const pilgrimageHOME({super.key});

  @override
  State<pilgrimageHOME> createState() => _pilgrimageHOMEState();
}

class _pilgrimageHOMEState extends State<pilgrimageHOME> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Places'),
                Tab(text: 'News'),
                Tab(text: 'Groups',)
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              placesScreenOfPilgrimage(),
              newsScreenOfPilgrimage(),
              groupScreenOfPilgrimage(),
            ],
          ),
        ),
    );
  }
}
