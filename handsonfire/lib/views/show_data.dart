import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Data"),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Users").snapshots(),
          builder: (context, snapshotdata){
            if(snapshotdata.connectionState==ConnectionState.active){
              if(snapshotdata.hasData){
                return ListView.builder(
                  itemCount: snapshotdata.data!.docs.length,
                  itemBuilder: (context,index){
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text("${index+1}"),
                    ),
                    title: Text("${snapshotdata.data!.docs[index]["Title"]}"),
                    subtitle: Text("${snapshotdata.data!.docs[index]["Description"]}"),
                  );
                },
                );
              } else {
                return Center(child: Text("${snapshotdata.hasError.toString()}"),);
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
      ),
    );
  }
}
