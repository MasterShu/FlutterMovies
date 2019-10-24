import 'package:flutter/material.dart';

import 'counterShared.dart';

class CounterSharedView extends StatefulWidget {
  @override
  _CounterSharedViewState createState() => _CounterSharedViewState();
}

class _CounterSharedViewState extends State<CounterSharedView> {
  CounterSharedModel _model;

  @override
  void initState() {
    _model = CounterSharedModel();
    _model.getValue().then((_) => setState((){}));
    super.initState();
  }

  _increment() async {
    await _model.increment();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Shared Preferences'),),
      body: Center(
        child: Text('${_model.value}'),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('increment'),
        onPressed: _increment,
        child: Icon(Icons.add),
      ),
    );
  }
}

