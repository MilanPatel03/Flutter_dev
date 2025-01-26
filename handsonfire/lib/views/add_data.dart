import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:handsonfire/views/show_data.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();

  addData(String title,String desc)async{
    if(title=="" && desc==""){
      log("Enter Required Fields");
    } else {
      FirebaseFirestore.instance.collection("Users").doc(title).set({
        "Title": title,
        "Description": desc
      }).then((value){
        log("Data Inserted");
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Add Data", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: "Enter Title",
                    suffixIcon: const Icon(Icons.title),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: desController,
                  decoration: InputDecoration(
                    hintText: "Enter Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: const Icon(Icons.description),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                addData(titleController.text.toString(), desController.text.toString());
              },
                  child: const Text("save data"),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  GestureDetector(onTap: (){
                    Get.to(const ShowData());
                  },child: const Icon(Icons.navigate_next)),
                  const Text("Proceed for show data"),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
