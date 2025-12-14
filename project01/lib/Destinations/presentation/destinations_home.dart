import 'package:flutter/material.dart';
import 'package:project01/Commons/constants.dart';
import 'package:project01/Destinations/presentation/group_screen.dart';
import 'package:project01/Destinations/presentation/news_screen.dart';
import 'package:project01/Destinations/presentation/places_screen.dart';
import 'package:project01/Destinations/presentation/widgets/DestinationTabBar.dart';

class DestinationsHome extends StatefulWidget {
  final DestinationType type;
  const DestinationsHome({super.key, required this.type});

  @override
  State<DestinationsHome> createState() => _DestinationsHomeState();
}

class _DestinationsHomeState extends State<DestinationsHome> with SingleTickerProviderStateMixin{

  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181818),
      appBar: AppBar(
        backgroundColor: const Color(0xff181818),
        title: Text(widget.type.title, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        bottom: Destinationtabbar(controller: _tabController),
      ),
      
      body: TabBarView(
        controller: _tabController,
          children: [
            PlacesScreen(type: widget.type),
            NewsScreen(type: widget.type),
            GroupScreen(type: widget.type),
          ],
      ),
    );
  }
}
