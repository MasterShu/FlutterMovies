import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'todolist.dart';
import 'counter/counterModel.dart';
import 'counter/counterProView.dart';
import 'counter/counterView.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: CounterModel(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: DemoPage(),
        ));
  }
}

class DemoPage extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('举个🌰')),
      body: ListView(
        children: <Widget>[
          todoList(context),
          counter(context),
          counterPro(context)
        ],
      ),
    );
  }
}
