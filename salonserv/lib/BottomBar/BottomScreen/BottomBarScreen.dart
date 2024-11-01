import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salonserv/BottomBar/BookingHistory/BookingHistoryScreen.dart';
import 'package:salonserv/home/homepage.dart';

class Bottombarscreen extends StatefulWidget {
  const Bottombarscreen({super.key});

  @override
  State<Bottombarscreen> createState() => _BottombarscreenState();
}

class _BottombarscreenState extends State<Bottombarscreen> {

  final List<Widget> _pages = [
    const homepage(),
    BookingHistoryScreen(route: 'BottomBarScreen',),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
