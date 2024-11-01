import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonserv/auth/view/LoginSignupScreen.dart';
import 'package:salonserv/auth/view/LoginSignupScreen01.dart';
import 'dart:async';

import 'package:salonserv/home/homepage.dart';

class Splashscreen01 extends StatefulWidget {
  const Splashscreen01({super.key});

  @override
  State<Splashscreen01> createState() => _Splashscreen01State();
}

class _Splashscreen01State extends State<Splashscreen01> {

  @override
  void initState() {
    super.initState();
    
    Timer(const Duration(seconds: 3), (){
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) =>  const Loginsignupscreen01()),
            (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 350,
          width: 350,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/animations/salon_saga01.png"),
            ),
          ),
        ),
      ),
    );
  }
}
