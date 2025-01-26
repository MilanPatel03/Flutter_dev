import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final Completer<GoogleMapController> _mapcont = Completer();
  static const CameraPosition _tenpurpos = CameraPosition(
      target: LatLng(23.208044, 72.9941563),
      zoom: 12,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _tenpurpos,
        onMapCreated: (GoogleMapController thiscontroller)
        {
          _mapcont.complete(thiscontroller);
        },
        compassEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
