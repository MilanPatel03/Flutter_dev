import 'package:flutter/material.dart';
import 'package:project01/DestinationHomes/wildLifeHome/GroupsScreenOfWildLife.dart';
import 'package:project01/DestinationHomes/wildLifeHome/NewsScreenOfWildLife.dart';
import 'package:project01/DestinationHomes/wildLifeHome/PlacesScreenOfWildLife.dart';

class wildlifeHOME extends StatefulWidget {
  const wildlifeHOME({super.key});

  @override
  State<wildlifeHOME> createState() => _wildlifeHOMEState();
}

class _wildlifeHOMEState extends State<wildlifeHOME> {
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
                placesScreenWildLife(),
                newsScreenWildLife(),
                groupsScreenWildLife(),
              ],
          ),
    ),
    );
  }
}
