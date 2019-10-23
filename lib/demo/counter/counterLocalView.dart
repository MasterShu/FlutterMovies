import 'package:flutter/material.dart';
import 'package:flutter_movies/demo/counter/counterLocal.dart';

class CounterLocalView extends StatefulWidget {
  @override
  _CounterLocalViewState createState() => _CounterLocalViewState(CounterLocal());
}

class _CounterLocalViewState extends State<CounterLocalView> {
  CounterLocal _counterLocal;
  _CounterLocalViewState(this._counterLocal);

  @override
  void initState() {
    super.initState();
    _counterLocal.getLocalValue().then((_) => setState((){})
    );
  }

  _increment() async {
    await _counterLocal.increment();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Counter use localstorage')),
        body: Center(child: Text('${_counterLocal.value}')),
        floatingActionButton: FloatingActionButton(
          onPressed: _increment,
          tooltip: 'increment',
          key: Key('increment'),
          child: Icon(Icons.add),
        ),
      )
    );
  }
}

