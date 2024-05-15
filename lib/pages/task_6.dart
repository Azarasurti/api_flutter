import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Todo {
  final int id;
  final String title;
  final bool completed;

  Todo({required this.id, required this.title, required this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}

class Task6 extends StatefulWidget {
  @override
  _Task6State createState() => _Task6State();
}

class _Task6State extends State<Task6> {
  List<Todo> _todos = [];
  List<Todo> _filteredTodos = [];
  bool _isAscending = true;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      List<Todo> todos = (json.decode(response.body) as List)
          .map((data) => Todo.fromJson(data))
          .toList();
      setState(() {
        _todos = todos;
        _filteredTodos = todos;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  void _filterTodos(String searchText) {
    setState(() {
      _filteredTodos = _todos
          .where((todo) =>
              todo.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void _sortTodos() {
    _todos.sort(
        (a, b) => _isAscending ? a.id.compareTo(b.id) : b.id.compareTo(a.id));
    _isAscending = !_isAscending;
    _filterTodos('');
  }

  void _filterCompleted() {
    setState(() {
      _filteredTodos =
          _todos.where((todo) => todo.completed == _isCompleted).toList();
      _isCompleted = !_isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 6'),
        actions: [
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: _sortTodos,
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: _filterCompleted,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterTodos,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredTodos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(_filteredTodos[index].id.toString()),
                  title: Text(_filteredTodos[index].title),
                  trailing: Icon(
                    _filteredTodos[index].completed ? Icons.check : Icons.close,
                    color: _filteredTodos[index].completed
                        ? Colors.green
                        : Colors.red,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
