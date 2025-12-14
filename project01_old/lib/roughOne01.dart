import 'package:flutter/material.dart';

class Roughone01 extends StatelessWidget {
  const Roughone01({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
          child: Scaffold(

            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                ],
              ),
            ),
      ),
      ),
    );
  }
}

/* child: Column(
                  children: [

                    //const FlexibleSpaceBar( title: Text('SliverAppBar'),),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 5),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: FlexibleSpaceBar(
                        title: Text(
                          "Explorearth",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15,
                            letterSpacing: 5,
                          ),
                        ),
                      ),
                    )
                    //SingleChildScrollView
                  ],
                ), */