import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:json_serialization01/model/comment_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// feilds
  String url;
  var response;
  List data;
  bool isLoading = true;

  List<Comment> comment;

// future method -> JSON get
  Future getComments() async {
    url = "https://jsonplaceholder.typicode.com/comments";
    response = await http.get(url);
    data = json.decode(response.body);

    setState(() {
      comment = data.map((json) => Comment.fromJson(json)).toList();
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON Serialization 02"),
      ),
      body: isLoading == true
          ? LinearProgressIndicator()
          : ListView.builder(
              itemCount: comment.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(comment[index].name),
                        Text(comment[index].email),
                      ],
                    ),
                    subtitle: Text(comment[index].body),
                  ),
                );
              },
            ),
    );
  }
}
