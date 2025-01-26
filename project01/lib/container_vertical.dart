import 'package:flutter/material.dart';
import 'package:project01/africa_page.dart';
import 'package:project01/antarctica_page.dart';
import 'package:project01/asia_page.dart';
import 'package:project01/australia_page.dart';
import 'package:project01/europe_page.dart';
import 'package:project01/north_ame_page.dart';
import 'package:project01/south_ame_page.dart';

class screen01 extends StatefulWidget {
  const screen01({super.key});

  @override
  State<screen01> createState() => _screen01State();
}

class _screen01State extends State<screen01> {
  List img = [
    "assets/continentsFor/africa02.png",
    "assets/continentsFor/antarctica01.png",
    "assets/continentsFor/asia01.png",
    "assets/continentsFor/australia.jpg",
    "assets/continentsFor/europe.jpg",
    "assets/continentsFor/north_ame.png",
    "assets/continentsFor/south_ame.png",
  ];

  List<Widget> continentPages = [
    const pageOfAfrica(),
    const pageOfAntarctica(),
    const pageOfAsia(),
    const pageOfAustralia(),
    const pageOfEurope(),
    const pageOfNorthAme(),
    const pageOfSouthAme(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(130),
            child: SizedBox(
              height: 120,
              child:ListView.builder(
                scrollDirection: Axis.horizontal,
                //shrinkWrap: true,
                  itemCount: img.length,
                  itemBuilder: (BuildContext context , int index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => continentPages[index],)
                          );
                        },

                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white60,
                            image: DecorationImage(
                              image: AssetImage(img[index]),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),



                    );
                  }
              )
            ),
          ),
        ),
      ),
    );
  }
  
}

/*child: CircleAvatar(
    radius: 35,
    backgroundImage: AssetImage(img[index]),
    backgroundColor: Colors.white60,
),*/