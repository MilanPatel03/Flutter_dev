import 'package:flutter/material.dart';
import 'package:project01/DestinationHomes/honeyMoonHome/GroupsScreenOfHoneyMoon.dart';
import 'package:project01/DestinationHomes/honeyMoonHome/NewsScreenOfHoneyMoon.dart';
import 'package:project01/DestinationHomes/honeyMoonHome/PlacesScreenOfHoneyMoon.dart';

class honeyMoonHOME extends StatefulWidget {
  const honeyMoonHOME({super.key});

  @override
  State<honeyMoonHOME> createState() => _honeyMoonHOMEState();
}

class _honeyMoonHOMEState extends State<honeyMoonHOME> {
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
              placesScreenOfHoneyMoon(),
              newsScreenOfHoneyMoon(),
              groupScreenOfHoneyMoon(),
            ],
          ),
        )
    );
  }
}
