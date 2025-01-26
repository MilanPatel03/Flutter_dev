import 'package:flutter/material.dart';

class pageOfSouthAme extends StatefulWidget {
  const pageOfSouthAme({super.key});

  @override
  State<pageOfSouthAme> createState() => _pageOfSouthAmeState();
}

class _pageOfSouthAmeState extends State<pageOfSouthAme> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('South America'),
        ),
      ),
    );
  }
}
