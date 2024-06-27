import 'dart:async';

import 'package:flutter/cupertino.dart';

class Autoimageslider extends StatefulWidget {
  const Autoimageslider({super.key});

  @override
  State<Autoimageslider> createState() => _AutoimagesliderState();
}

class _AutoimagesliderState extends State<Autoimageslider> {
  PageController _pageController = PageController();
  List<String> imgs = [
    'https://media.cntraveler.com/photos/576af69fc06bba921a97a0bc/1:1/w_800%2Cc_limit/Taj-Mahal-GettyImages-485899645.jpg',
    'https://media.cntraveler.com/photos/576af69f558ff1e22af12771/master/w_800%2Cc_limit/Bunaken-Marine-Park-GettyImages-168389000.jpg',
    'https://media.cntraveler.com/photos/576af6a4c06bba921a97a0be/master/w_800%2Cc_limit/Hawa-Mahal-GettyImages-187979190.jpg',
    'https://media.cntraveler.com/photos/576af6a2c06bba921a97a0bd/master/w_800%2Cc_limit/Ajanta-Caves-GettyImages-145598799.jpg',
    'https://media.cntraveler.com/photos/576af69cc06bba921a97a0bb/master/w_800%2Cc_limit/Borobodur-GettyImages-489761774.jpg',
    'https://media.cntraveler.com/photos/576af69b4a3399cb31f9da38/master/w_800%2Cc_limit/Raja-Ampat-GettyImages-497311417.jpg',
  ];

  int _currentPage=0;
  Timer _timer;
  // initState

  @override
  void initState(){
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3),(Timer timer){

      if(_currentPage < imgs.length -1){
        _currentPage++;

      } else {
        _currentPage=0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve
      );

    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(itemBuilder: (context, index){
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imgs[index]),
            fit: BoxFit.cover,
          ),
        ),
      );

    });
  }
}
