import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// feilds
  String url;
  var response;
  var data;
  bool isLoading = true;

// future method -> api data -> response -> decode
  Future fetchData() async {
    url = "https://jsonplaceholder.typicode.com/posts";
    response = await http.get(url);

    setState(() {
      data = json.decode(response.body);
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON Serialization 01"),
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]['title']),
                  subtitle: Text(data[index]['body']),
                );
              },
            ),
    );
  }
}
