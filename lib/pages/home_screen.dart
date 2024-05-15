import 'package:flutter/material.dart';
import 'package:login_signup_page/pages/task_5.dart';
import 'package:login_signup_page/pages/task_4.dart';
import 'package:login_signup_page/pages/task_6.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: createCard('Task 4', context, Task4())),
          Expanded(child: createCard('Task 5', context, Task5())),
          Expanded(child: createCard('Task 6', context, Task6())),
        ],
      ),
    );
  }

  Card createCard(String taskName, BuildContext context, Widget taskScreen) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => taskScreen),
          );
        },
        child: Center(
          child: Text(
            taskName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
