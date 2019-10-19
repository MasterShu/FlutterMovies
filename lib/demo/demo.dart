import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/demo/todolist.dart';

class Demo extends StatelessWidget {

  static final todoList = (context) => ListTile(
    title: Text('TodoList'),
    leading: Icon(Icons.list),
    onTap: () => Navigator.push(context,
      MaterialPageRoute(builder: (context) => TodoList())
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('举个🌰')),
      body: ListView(
        children: <Widget>[
          todoList(context)
        ],
      ),
    );
  }
}
