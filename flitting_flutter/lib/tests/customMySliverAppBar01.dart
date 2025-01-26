import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custommysliverappbar01 extends StatefulWidget {
  const Custommysliverappbar01({super.key});

  @override
  State<Custommysliverappbar01> createState() => _Custommysliverappbar01State();
}

class _Custommysliverappbar01State extends State<Custommysliverappbar01> {
  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,


      backgroundColor: Colors.white,
      title: Text("Title"),

    );
  }
}
