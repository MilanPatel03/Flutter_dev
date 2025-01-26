import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newfirebase/Quotes_model.dart';

import 'carts_model.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  QuotesMainModel?mQuotes;
  getData()async{
    var respo =await http.get(Uri.parse("https://dummyjson.com/quotes"));
    if(respo.statusCode==200){
      var data = jsonDecode(respo.body);
      print(data);
      mQuotes= QuotesMainModel.fromJson(data);
      setState(() {

      });
    }
  }

  CartsMainModel? carts;

  getCartsData()async{
    final fetchRespo = await http.get(Uri.parse("https://dummyjson.com/carts"));
    if(fetchRespo.statusCode == 200){
      var cartsData = jsonDecode(fetchRespo.body);
      carts = CartsMainModel.fromjson(cartsData);
      setState(() {});
    }
  }

  @override
  void initState() {
    getCartsData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    getCartsData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: carts!=null?carts!.carts!.isNotEmpty?ListView.builder(
          itemBuilder: (_,index){
            var eachCart = carts!.carts![index];
            return Column(

              children: [
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: carts!.carts![index].products!.length,
                      itemBuilder:(_,childindex){
                    return Container(
                      width: 300,
                      height: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(carts!.carts![index].products![childindex].thumbnail),fit: BoxFit.cover)
                      ),
                      child: Center(child: Text(carts!.carts![index].products![childindex].title.toString())),
                    );
                  } ),
                ),
                ListTile(
                  leading: CircleAvatar(child: Text(eachCart.id.toString()),),

                  subtitle: Text(eachCart.totalProducts!.toString()),
                ),
              ],
            );

      }, itemCount: carts!.carts!.length,) : const Center(child: Text("Nodata"),) : const Center(child: CircularProgressIndicator(),),

    );
  }
}

/*
body: mQuotes!=null?mQuotes!.quotes!.isNotEmpty?ListView.builder(itemBuilder: (_,index){
        var eachQuotes =mQuotes!.quotes![index];
        return ListTile(
          leading: CircleAvatar(child: Text(eachQuotes.id.toString()),),
          title: Text(eachQuotes.quote.toString()),
          subtitle: Text(eachQuotes.author.toString()),
        );
      }):Center(child: Text("No data"),):Center(child: CircularProgressIndicator(),),
*/
