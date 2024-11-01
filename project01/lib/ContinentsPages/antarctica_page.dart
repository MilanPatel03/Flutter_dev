import 'package:flutter/material.dart';

class pageOfAntarctica extends StatefulWidget {
  const pageOfAntarctica({super.key});

  @override
  State<pageOfAntarctica> createState() => _pageOfAntarcticaState();
}

class _pageOfAntarcticaState extends State<pageOfAntarctica> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('Antarctica'),
        ),
      ),
    );
  }
}
