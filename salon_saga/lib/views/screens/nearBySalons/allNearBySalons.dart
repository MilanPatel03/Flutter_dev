import 'package:flutter/material.dart';

class Allnearbysalons extends StatefulWidget {
  const Allnearbysalons({super.key});

  @override
  State<Allnearbysalons> createState() => _AllnearbysalonsState();
}

class _AllnearbysalonsState extends State<Allnearbysalons> {

  Color appbarTextColor = Colors.white;
  Color brownColorOfAppBar = const Color(0xFFAF7F1F).withOpacity(0.9);
  Color brownColorApp = const Color(0xFFAF7F1F);
  Color screenColor = const Color(0xFFFFFFFF);
  String locationOfUser = "Ahmedabad";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Stack(),
      ),
    );
  }
}
