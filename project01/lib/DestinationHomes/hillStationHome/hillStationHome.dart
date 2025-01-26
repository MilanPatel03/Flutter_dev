import 'package:flutter/material.dart';
import 'package:project01/DestinationHomes/hillStationHome/GroupScreenOfHillStation.dart';
import 'package:project01/DestinationHomes/hillStationHome/NewsScreenOfHillStation.dart';
import 'package:project01/DestinationHomes/hillStationHome/PlacesScreenOfHillStation.dart';

class hillStationHOME extends StatefulWidget {
  const hillStationHOME({super.key});

  @override
  State<hillStationHOME> createState() => _hillStationHOMEState();
}

class _hillStationHOMEState extends State<hillStationHOME> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Places',),
                Tab(text: 'News',),
                Tab(text: 'Groups',),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              placesScreenOfHillStation(),
              newsScreenOfHillStation(),
              groupScreenOfHillStation(),
            ],
          ),
        ),
    );
  }
}
