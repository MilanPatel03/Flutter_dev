/*InkWell(
onLongPress: () {
Navigator.push(
context,
MaterialPageRoute(builder: (context) => multiwidg()),
);
},
child: ClipRRect(
borderRadius: BorderRadius.circular(100),
child: Container(
height: 200,
width: 200,
child: Image.asset(
"assets/img.png",
fit: BoxFit.cover,
)),
),
),*/
/* InkWell(
                onLongPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => multiwidg()),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                      height: 200,
                      width: 200,
                      child: Image.asset(
                        "assets/img.png",
                        fit: BoxFit.cover,
                      )),
                ),
              ), */

/* return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [

              Card(
                child: Column(
                  children: [
                     Card(
                      margin: EdgeInsets.only(top: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        child: Container(
                          height: 200,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    Row(

                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    ); */

/*Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }*/

/*ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.white60,
                              //border: Border.all(color: Colors.black45, width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.asset(
                                "assets/continentsFor/north_america.png",
                              ),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 70,
                            width: 70,
                            //margin: EdgeInsets.all(10),

                            decoration: BoxDecoration(
                                color: Colors.white60,
                                //border: Border.all(color: Colors.black45, width: 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.asset(
                                "assets/continentsFor/south_america.png",
                              ),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 70,
                            width: 70,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white60,
                                border:
                                    Border.all(color: Colors.black45, width: 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.asset(
                                "assets/continentsFor/africa.png",
                              ),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 70,
                            width: 70,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white60,
                                border:
                                    Border.all(color: Colors.black45, width: 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.asset(
                                "assets/continentsFor/antarctica.png",
                              ),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 70,
                            width: 70,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white60,
                                border:
                                    Border.all(color: Colors.black45, width: 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.asset(
                                "assets/continentsFor/asia01.png",
                              ),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 70,
                            width: 70,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white60,
                                border:
                                    Border.all(color: Colors.black45, width: 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.asset(
                                "assets/continentsFor/australia.jpg",
                              ),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 70,
                            width: 70,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white60,
                                border:
                                    Border.all(color: Colors.black45, width: 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.asset(
                                "assets/continentsFor/europe.jpg",
                              ),
                            ),
                          ),
                        ),*/

/* ${titles[index].toLowerCase().replaceAll(' ', '_')}.png" */

/* North AMERICA SCROLL CODE
return SingleChildScrollView(
      child: Card(
        color: Colors.transparent,
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      color: Colors.white70,
                      child: ListView.builder(
                        itemCount: site1.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              _launchNAURL(urlsNA[index]);
                            },
                            child: Image.network(
                              site1[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
 */

/* borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  color: Colors.white70,
                  child: ListView.builder(
                    itemCount: site1.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          _launchNAURL(urlsNA[index]);
                        },
                        child: Image.network(
                          site1[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
 */


//container of wildLife....Cards

/* Positioned(
                            bottom: 10,
                            left: 10,
                            right: 10,
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.4),
                                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(9), bottomRight: Radius.circular(9)),
                              ),
                              child: Text(
                                destinations[index],
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  shadows: [
                                    const Shadow(
                                      offset: Offset(1,1.3),
                                      color: Colors.black54,
                                    )
                                  ],
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ) */

/* appBar: PreferredSize(
          preferredSize: const Size.fromHeight(145),
          child: AppBar(
            backgroundColor: Colors.blue.shade900.withOpacity(0.5),
            flexibleSpace: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 34),
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Container(
                          alignment: Alignment.center,
                          height: 25,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.rectangle,

                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.1),
                                blurRadius: 3,
                                blurStyle: BlurStyle.solid,
                              ),
                            ],
                          ),

                          child: Text(
                            'CONTINENTS',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 10,
                      right: 10,
                    ),
                    child: Row(
                      children: List.generate(titles.length, (index) {
                        return _buildImageContainer(
                          context,
                          "assets/continentsFor/${titles[index].toLowerCase().replaceAll(' ', '_')}.png",
                          titles[index],
                          index,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),*/

/*  child: Container(
                              height: 40,
                              padding: const EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width,

                              decoration: BoxDecoration(
                                color: Colors.black38,

                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                alignment: Alignment.center,
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(

                                    color: Colors.transparent,
                                    //shape: BoxShape.rectangle,

                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)
                                    ),

                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.3,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 50,
                                        blurStyle: BlurStyle.inner,
                                      )
                                    ]),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    destinations[index],
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      letterSpacing: 0.5,
                                      color: Colors.white,

                                        shadows: [
                                          const Shadow(
                                            blurRadius: 30,
                                            color: Colors.white,
                                            //offset: Offset(2, 2.5),
                                          ),
                                        ],

                                    ),
                                    ),

                                  ),
                              ),
                            ), */

/*  Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                alignment: Alignment.center,
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(

                                    color: Colors.transparent,
                                    //shape: BoxShape.rectangle,

                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)
                                    ),

                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.3,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 50,
                                        blurStyle: BlurStyle.inner,
                                      )
                                    ]),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    destinations[index],
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      letterSpacing: 0.5,
                                      color: Colors.white,

                                      shadows: [
                                        const Shadow(
                                          blurRadius: 30,
                                          color: Colors.white,
                                          //offset: Offset(2, 2.5),
                                        ),
                                      ],

                                    ),
                                  ),

                                ),
                              ),*/