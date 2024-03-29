import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  static final _title = "Todo List";
  final todos = <String>[];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: controller,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      final todo = todos[index];

                      return Dismissible(
                          key: Key('$todo$index'),
                          onDismissed: (direction) => todos.removeAt(index),
                          child: ListTile(title: Text(todo)),
                          background:
                              Container(color: Colors.deepPurpleAccent));
                    }))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              todos.add(controller.text);
              controller.clear();
            });
          },
          child: Icon(Icons.add),
        ),
      );
  }
}
