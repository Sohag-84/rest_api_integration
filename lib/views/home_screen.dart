// ignore_for_file: prefer_const_constructors_in_immutables, unused_field, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/comments_helper.dart';
import '../models/comment_model.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  List<Comment>? comment;

  getData() async {
    comment = await CommentHelper().getApi();
    setState(
      () {
        _isLoading = false;
      },
    );
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Demo"),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15, top: 10, bottom: 10),
              child: SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: comment!.length,
                  itemBuilder: (_, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        onTap: () {
                          var id = comment![index].id;
                          var name = comment![index].name;
                          var email = comment![index].email;
                          var body = comment![index].body;
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) {
                                return DetailsScreen(
                                    id: id,
                                    name: name,
                                    email: email,
                                    body: body);
                              },
                            ),
                          );
                        },
                        leading: CircleAvatar(
                          child: Text(comment![index].name[0]),
                        ),
                        title: Text(comment![index].name),
                        subtitle: Text(comment![index].email),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
