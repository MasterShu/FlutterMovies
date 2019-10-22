import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counterModel.dart';

class CounterProView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Provider View')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer<CounterModel>(
                builder: (context, CounterModel _counter, _) => Text(
                      '${_counter.value}',
                      key: Key('counter'),
                    )),
          ],
        ),
      ),
      floatingActionButton: Consumer<CounterModel>(
        builder: (context, CounterModel _counter, child) =>
            FloatingActionButton(
          key: Key('increment'),
          onPressed: _counter.increment,
          child: child,
        ),
        child: TestIcon(),
      ),
    );
  }
}

//用于打印build方法执行情况的自定义控件
class TestIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("TestIcon build");
    return Icon(Icons.add); //返回Icon实例
  }
}
