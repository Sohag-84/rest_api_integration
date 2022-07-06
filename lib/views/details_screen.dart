// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  int id;
  String name;
  String email;
  String body;
  DetailsScreen(
      {Key? key,
      required this.id,
      required this.name,
      required this.email,
      required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Screen"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white70
          ),
          child: Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                color: Colors.orangeAccent,
                child: Padding(
                  padding: const EdgeInsets.only(left:15.0,right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Id:${id.toString()}",style: TextStyle(fontSize: 16,color: Colors.black),),
                      SizedBox(height: 10,),
                      Text("Name:${name.toString()}",style: TextStyle(fontSize: 18,color: Colors.black),),
                      SizedBox(height: 8,),
                      Text("Email:${email.toString()}",style: TextStyle(fontSize: 18,color: Colors.black),),
                      SizedBox(height: 8,),
                      Text("Body:${body.toString()}",style: TextStyle(fontSize: 14,color: Colors.black),),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
