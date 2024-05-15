import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class Task5 extends StatefulWidget {
  const Task5({super.key});

  @override
  State<Task5> createState() => _Task5State();
}

class _Task5State extends State<Task5> {
  List<ImageData> dataList = [];

  Future<List<ImageData>> getData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        ImageData data = ImageData(
            title: i['title'] ?? '',
            body: i['body'] ?? '',
            id: i['id'],
            url: i['url'] ?? '');
        dataList.add(data);
      }
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  // In your _Task5State class

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('Image Data from API', style: TextStyle(fontSize: 30)),
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
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ImageScreen(data: dataList[index]),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(dataList[index].url),
                          ),
                          title: Text(dataList[index].title),
                          subtitle: Text(dataList[index].body),
                        ),
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

class ImageScreen extends StatelessWidget {
  final ImageData data;

  ImageScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.network(data.url),
      ),
    );
  }
}

class ImageData {
  late String title;
  late String body;
  late int id;
  late String url;
  ImageData(
      {required this.title,
      required this.body,
      required this.id,
      required this.url});
}
