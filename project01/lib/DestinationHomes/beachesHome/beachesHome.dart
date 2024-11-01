import 'package:flutter/material.dart';
import 'package:project01/DestinationHomes/beachesHome/GroupScreenOfBeaches.dart';
import 'package:project01/DestinationHomes/beachesHome/NewsScreenOfBeaches.dart';
import 'package:project01/DestinationHomes/beachesHome/PlacesScreenOfBeaches.dart';

class beachesHOME extends StatefulWidget {
  const beachesHOME({super.key});

  @override
  State<beachesHOME> createState() => _beachesHOMEState();
}

class _beachesHOMEState extends State<beachesHOME> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tab(text: 'Places',),
              Tab(text: 'News',),
              Tab(text: 'Group',)
            ]),
          ),
          body: const TabBarView(
            children: [
              placesScreenOfBeaches(),
              newsScreenOfBeaches(),
              groupScreenOfBeaches(),
            ],
          ),
        ),
    );
  }
}
