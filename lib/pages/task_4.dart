import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Task4 extends StatefulWidget {
  Task4({Key? key}) : super(key: key);

  @override
  _Task4State createState() => _Task4State();
}

class _Task4State extends State<Task4> {
  List<Data> dataList = [];

  Future<List<Data>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        Data data = Data(title: i['title'], body: i['body'], id: i['id']);
        dataList.add(data);
      }
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Home Screen'),
          ),
      body: Column(
        children: [
          Text('Data from API', style: TextStyle(fontSize: 30)),
          SizedBox(height: 20),
          Expanded(
            child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return ListView.builder(
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(dataList[index].id.toString()),
                        title: Text(dataList[index].title),
                        subtitle: Text(dataList[index].body),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class Data {
  late String title;
  late String body;
  late int id;
  Data({required this.title, required this.body, required this.id});
}
