import 'package:flutter/material.dart';
import 'package:flutter_movies/demo/models/todo.dart';

class TodoSqlite extends StatefulWidget {
  @override
  _TodoSqliteState createState() => _TodoSqliteState();
}

class _TodoSqliteState extends State<TodoSqlite> {
  static final _title = "Todo Sqlite Version";
  List<Todo> _todos = <Todo>[];
  final controller = TextEditingController();
  Todo _todo;

  @override
  void initState() {
    _todo = Todo();
    _todo.getAll().then((todos) {
      _todos = todos;
      setState(() {});
    });
    super.initState();
  }

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
                    itemCount: _todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Todo todo = _todos[index];

                      return Dismissible(
                          key: Key('${todo.id}_$index'),
                          onDismissed: (direction) async {
                            await todo.delete();
                            _todos.remove(todo);
                          },
                          child: ListTile(
                            title: Text(todo.title),
                            subtitle: Text('创建于：'+DateTime.parse(todo.createdAt).toIso8601String()),
                          ),
                          background:
                              Container(color: Colors.deepPurpleAccent));
                    }))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var todo = Todo(title: controller.text);
            var id = await todo.add();
            if(id > 0) {
              todo.id = id;
              _todos.add(todo);
              setState(() {controller.clear();});
            }
          },
          child: Icon(Icons.add),
        ),
      );
  }
}
