import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_movies/demo/demo_event.dart';
import 'package:provider/provider.dart';

import 'counter/counterLocalView.dart';
import 'counter/counterSharedView.dart';
import 'todo_list/todo_sqlite.dart';
import 'todo_list/todolist.dart';
import 'counter/counterModel.dart';
import 'counter/counterProView.dart';
import 'counter/counterView.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: ChangeNotifierProvider.value(
        value: CounterModel(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: DemoPage(context),
        )),
      onWillPop: () async {
        DemoEvent().eventBus.fire(BackClickEvent('back'));
        ModalRoute.of(context).navigator.toString();
        return false;
      }
    );
  }
}

class DemoPage extends StatefulWidget {
  final BuildContext _context;
  DemoPage(this._context);

  @override
  _DemoPageState createState() => _DemoPageState(_context);
}

class _DemoPageState extends State<DemoPage> {
  BuildContext _context;
  StreamSubscription subscription;

  _DemoPageState(this._context);

  _buildList(context, title, icon, view) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => view)
      ),
    );
  }
  static final todoList = (context) => ListTile(
    title: Text('TodoList'),
    leading: Icon(Icons.list),
    onTap: () => Navigator.push(
      context, MaterialPageRoute(builder: (context) => TodoList())),
  );
  static final counter = (context) => ListTile(
    leading: Icon(Icons.calendar_today),
    title: Text('计数器'),
    onTap: () => Navigator.push(
      context, MaterialPageRoute(builder: (context) => CounterView())),
  );
  final counterPro = (context) => ListTile(
    leading: Icon(Icons.alarm),
    title: Text('计数器 provider 版'),
    onTap: () => Navigator.push(
      context, MaterialPageRoute(builder: (context) => CounterProView())),
    subtitle: Consumer<CounterModel>(
      builder: (context, CounterModel _counter, _) =>
        Text('${_counter.value}')),
  );
  static final counterLocal = (context) => ListTile(
    leading: Icon(Icons.calendar_today),
    title: Text('计数器 file 存储版'),
    onTap: () => Navigator.push(
      context, MaterialPageRoute(builder: (context) => CounterLocalView())),
  );
  static final counterShared = (context) => ListTile(
    leading: Icon(Icons.calendar_today),
    title: Text('计数器 SharedPerferences 版'),
    onTap: () => Navigator.push(
        context, MaterialPageRoute(builder: (context) => CounterSharedView())),
  );

  @override
  void initState() {
    subscription = DemoEvent().eventBus.on<BackClickEvent>().listen((event) {
      var navigator = ModalRoute.of(context).navigator;
      if(navigator.canPop()) {
        ModalRoute.of(context).navigator.pop();
      } else {
        Navigator.pop(_context);
      }
    });
    super.initState();
  }

  dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('举个🌰'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.pop(_context),)
        ],
      ),
      body: ListView(
        children: <Widget>[
          todoList(context),
          _buildList(context, 'Todo Sqlite Version', Icons.list, TodoSqlite()),
          counter(context),
          counterLocal(context),
          counterPro(context),
          counterShared(context),
        ],
      ),
    );
  }
}
