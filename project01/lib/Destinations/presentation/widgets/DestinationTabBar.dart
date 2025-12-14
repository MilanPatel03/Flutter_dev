import 'package:flutter/material.dart';

class Destinationtabbar extends StatelessWidget implements PreferredSize{
  final TabController? controller;
  const Destinationtabbar({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      indicatorColor: Colors.orangeAccent.shade200,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      tabs: const [
        Tab(text: "Places"),
        Tab(text: "News"),
        Tab(text: "Group")
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);

  // This is the only line you need to add — super clean
  @override
  Widget get child => this; // Yes, just return yourself!


}
