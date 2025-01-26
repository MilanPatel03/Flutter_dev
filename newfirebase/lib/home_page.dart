import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newfirebase/carts_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<dynamic> m=[];
  getData()async{
    var resspo =await http.get(Uri.parse("https://dummyjson.com/quotes"));
    if(resspo.statusCode==200){
     var data = jsonDecode(resspo.body);
      m = data['quotes'];
      print(data);
    }
  }

  @override
  void initState() {
    getData();
  }


  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: m!=null?m.isNotEmpty?ListView.builder(
        itemCount: m.length,
        itemBuilder: (_,index){
        return ListTile(
          title: Text(m[index]['quotes']),
          subtitle: Text(m[index]['author']),
        );
      },):Center(child: CircularProgressIndicator(),):Center(child: Text("No data"),),
    );
  }
}


