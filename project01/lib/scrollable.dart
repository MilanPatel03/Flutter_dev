import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class multiwidg extends StatefulWidget {
  const multiwidg({super.key});

  @override
  State<multiwidg> createState() => _multiwidgState();
}

class _multiwidgState extends State<multiwidg> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Scaffold(

      body: SingleChildScrollView(
      //mainAxisAlignment: MainAxisAlignment.start,
      child: Column(
      children: [

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [


              Container(height: 90, width: 90,margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: CupertinoColors.systemGreen,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black45,width: 1)),),
              //SizedBox(height: 16.0),
              Container(height: 90, width: 90,margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: CupertinoColors.systemGreen,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black45,width: 1)),),
              //SizedBox(height: 16.0),
              Container(height: 90, width: 90,margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: CupertinoColors.systemGreen,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black45,width: 1)),),
              //SizedBox(height: 16.0),
              Container(height: 90, width: 90,margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: CupertinoColors.systemGreen,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black45,width: 1)),),
              //SizedBox(height: 16.0),
              Container(height: 90, width: 90,margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: CupertinoColors.systemGreen,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black45,width: 1)),),
            ],

          ),


        ),
        const SizedBox(height: 16.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,

          child:Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(height: 200,width: 200,margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white60,borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black45,width: 1)),),
              Container(height: 200,width: 90,margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white60,borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black45,width: 1)),),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 150,width: 200,margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.white60,borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black45,width: 1)),)
          ],
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 250, width: 250,margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.white60,borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black45,width: 1)),)
          ],

        )



      ],




      ),


      ),
    ),

    );
  }
}
